From: sean.j.christopherson@intel.com (Sean Christopherson)
Date: Mon, 13 May 2019 07:03:05 -0700
Subject: [PATCH v2] selftests: kvm: Add files generated when compiled to
 .gitignore
In-Reply-To: <20190512044434.32627-1-skunberg.kelsey@gmail.com>
References: <5d60e7126803e9a11b51618e65966ba047eff7df>
 <20190512044434.32627-1-skunberg.kelsey@gmail.com>
Message-ID: <20190513140305.GA28561@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190513140305.M4hh2Y_ccKxqLVJWz5ZiOewytgpQuWFaRSKrFHAQIZQ@z>

On Sat, May 11, 2019@10:44:34PM -0600, Kelsey Skunberg wrote:
> The following files are generated in /selftests/kvm/ after compiling and
> should be added to /selftests/kvm/.gitignore:
> 
>         - /x86_64/hyperv_cpuid
> 	- /x86_64/smm_test
> 	- /clear_dirty_log_test
> 
> Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
> ---

An equivalent patch has already been queued.

https://patchwork.kernel.org/patch/10931115/

> Changes since v1:
>         - Included /clear_dirty_log_test to .gitignore
>         - Updated commit log to reflect file added
> 
>  tools/testing/selftests/kvm/.gitignore | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/.gitignore b/tools/testing/selftests/kvm/.gitignore
> index 2689d1ea6d7a..391a19231618 100644
> --- a/tools/testing/selftests/kvm/.gitignore
> +++ b/tools/testing/selftests/kvm/.gitignore
> @@ -6,4 +6,7 @@
>  /x86_64/vmx_close_while_nested_test
>  /x86_64/vmx_tsc_adjust_test
>  /x86_64/state_test
> +/x86_64/hyperv_cpuid
> +/x86_64/smm_test
> +/clear_dirty_log_test
>  /dirty_log_test
> --
> 2.20.1
> 
