From: alexei.starovoitov at gmail.com (Alexei Starovoitov)
Date: Wed, 17 Oct 2018 21:51:45 -0700
Subject: [PATCH]  selftest/bpf : file resource leak
In-Reply-To: <1539783685-5549-1-git-send-email-penghao122@sina.com.cn>
References: <1539783685-5549-1-git-send-email-penghao122@sina.com.cn>
Message-ID: <20181018045144.do7q3ajegiulzilk@ast-mbp.dhcp.thefacebook.com>

On Wed, Oct 17, 2018 at 09:41:25AM -0400, Peng Hao wrote:
> 
> From: Peng Hao <peng.hao2 at zte.com.cn>
> 
> FILE pointer variable f is opened but never closed.
> 
> Signed-off-by: Peng Hao <peng.hao2 at zte.com.cn>
> ---
>  tools/testing/selftests/bpf/trace_helpers.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/bpf/trace_helpers.c b/tools/testing/selftests/bpf/trace_helpers.c
> index cabe2a3..a3d1dac 100644
> --- a/tools/testing/selftests/bpf/trace_helpers.c
> +++ b/tools/testing/selftests/bpf/trace_helpers.c
> @@ -41,6 +41,7 @@ int load_kallsyms(void)
>  		syms[i].name = strdup(func);
>  		i++;
>  	}
> +	fclose(f);

looks good.
please resubmit cc-ing netdev, so it gets into patchwork and we can apply it properly.
Please change subj to [PATCH bpf-next] and add a Fixes tag.
Thanks!
