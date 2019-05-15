From: jakub.kicinski at netronome.com (Jakub Kicinski)
Date: Wed, 15 May 2019 14:50:37 -0700
Subject: [PATCH bpf v1 3/3] selftests/bpf: Avoid a clobbering of errno
In-Reply-To: <20190515134731.12611-4-krzesimir@kinvolk.io>
References: <20190515134731.12611-1-krzesimir@kinvolk.io>
 <20190515134731.12611-4-krzesimir@kinvolk.io>
Message-ID: <20190515145037.6918f626@cakuba.netronome.com>

On Wed, 15 May 2019 15:47:28 +0200, Krzesimir Nowak wrote:
> Save errno right after bpf_prog_test_run returns, so we later check
> the error code actually set by bpf_prog_test_run, not by some libcap
> function.
> 
> Cc: Jakub Kicinski <jakub.kicinski at netronome.com>
> Fixes: 5a8d5209ac022 ("selftests: bpf: add trivial JSET tests")

This commit (of mine) just moved this code into a helper, the bug is
older:

Fixes: 832c6f2c29ec ("bpf: test make sure to run unpriv test cases in test_verifier")

> Signed-off-by: Krzesimir Nowak <krzesimir at kinvolk.io>
> ---
>  tools/testing/selftests/bpf/test_verifier.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/bpf/test_verifier.c b/tools/testing/selftests/bpf/test_verifier.c
> index bf0da03f593b..514e17246396 100644
> --- a/tools/testing/selftests/bpf/test_verifier.c
> +++ b/tools/testing/selftests/bpf/test_verifier.c
> @@ -818,15 +818,17 @@ static int do_prog_test_run(int fd_prog, bool unpriv, uint32_t expected_val,
>  	__u32 size_tmp = sizeof(tmp);
>  	uint32_t retval;
>  	int err;
> +	int saved_errno;
>  
>  	if (unpriv)
>  		set_admin(true);
>  	err = bpf_prog_test_run(fd_prog, 1, data, size_data,
>  				tmp, &size_tmp, &retval, NULL);
> +	saved_errno = errno;
>  	if (unpriv)
>  		set_admin(false);
>  	if (err) {
> -		switch (errno) {
> +		switch (saved_errno) {
>  		case 524/*ENOTSUPP*/:
>  			printf("Did not run the program (not supported) ");
>  			return 0;
