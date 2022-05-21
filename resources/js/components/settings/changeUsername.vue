<template>
    <div>
        <base-dialog :show="!!error" title="An error occurred" @close="handleError">
                <p> {{ error }}  </p>
        </base-dialog>
        <base-dialog :show="isLoading" title="Updating Your Username..." fixed>
            <base-spinner></base-spinner>
        </base-dialog>
        <div class="tab-pane" id="account">
            <h6>ACCOUNT SETTINGS</h6>
            <hr>
            <form method="PUT" @submit.prevent="ChangeUsername">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" class="form-control" id="username" aria-describedby="usernameHelp" placeholder="Enter your username" v-model="changeUsername">
                    <small id="usernameHelp" class="form-text text-muted">After changing your username, your old username becomes available for anyone else to claim.</small>
                </div>
                <div class="py-3">
                    <button class="btn btn-primary" type="submit">Change Username</button>
                </div>
            </form>
                <hr>
            <form method="DELETE" @submit.prevent="deleteUser">
                <div class="form-group">
                    <label class="d-block text-danger">Delete Account</label>
                    <p class="text-muted font-size-sm">Once you delete your account, there is no going back. Please be certain.</p>
                </div>
                <button class="btn btn-danger" type="submit">Delete Account</button>
            </form>
        </div>
    </div>
</template>

<script>
import { mapGetters, mapMutations} from 'vuex';

export default {
    data() {
        return {
            changeUsername: null,
            error: null,
            isLoading: false,
        }
    },
    created() {
        this.loadUsername();
    },
    methods: {
        loadUsername() {
            try {
                axios.get('/api/user/loadUsername/' + this.userId)
                .then(({data}) => ( this.changeUsername = data ))
            } catch (error) {
                console.log(error);
                this.error = error.message || 'Could not load data. Try again later.'
            }
        },
        async ChangeUsername() {
            if(this.changeUsername) {
                this.isLoading = true;
                try {
                    const payload = { username: this.changeUsername, };

                    await axios.get('/sanctum/csrf-cookie')

                    await axios.put('/api/user/changeUsername/'+this.userId, payload, {
                        withCredentials: true,
                    })

                    this.$store.commit('setUsername', payload);

                    Toast.fire({
                        icon: 'success',
                        title: 'Profile updated successfully'
                    })
                } catch (error) {
                    console.log(error);
                    this.error = error.message || 'Could not upload data. Try again later.'
                }
                this.isLoading = false;
            } else {
                this.error = "Username Required!"
            }
        },
        handleError() {
            this.error = false;
        },
        deleteUser() {
            Swal.fire({
            title: 'Are you sure you want to delete the account?',
            icon: 'question',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Delete it'
            }).then((result) => {
            if (result.isConfirmed) {
                axios.delete('/api/user/' + this.userId)
                    .then(
                        Toast.fire({
                            icon: 'success',
                            title: 'User Deleted successfully'
                        })
                    )
                    this.$store.dispatch('logout');
                    this.$router.replace('/login');
                }
            })
        },
    },
    computed:{
        ...mapGetters({userId: 'userId'}),
        ...mapMutations(['setUsername']),
    },
}
</script>

<style scoped>

</style>