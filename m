From: alexei.starovoitov@gmail.com (Alexei Starovoitov)
Date: Thu, 6 Sep 2018 10:57:18 -0700
Subject: [PATCH bpf] selftests/bpf: add missing executables to .gitignore
In-Reply-To: <1535990727-2778-1-git-send-email-mauricio.vasquez@polito.it>
References: <1535990727-2778-1-git-send-email-mauricio.vasquez@polito.it>
Message-ID: <20180906175716.5vaxpmclyvottvys@ast-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180906175718.LLqyNcagK5HVhH6nAsXriCp1-aR_xYUSS5Qs2oqyFfY@z>

On Mon, Sep 03, 2018@06:05:27PM +0200, Mauricio Vasquez B wrote:
> Signed-off-by: Mauricio Vasquez B <mauricio.vasquez at polito.it>
> ---
>  tools/testing/selftests/bpf/.gitignore | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tools/testing/selftests/bpf/.gitignore b/tools/testing/selftests/bpf/.gitignore
> index 49938d72cf63..4d789c1e5167 100644
> --- a/tools/testing/selftests/bpf/.gitignore
> +++ b/tools/testing/selftests/bpf/.gitignore
> @@ -19,3 +19,7 @@ test_btf
>  test_sockmap
>  test_lirc_mode2_user
>  get_cgroup_id_user
> +test_skb_cgroup_id_user
> +test_socket_cookie
> +test_cgroup_storage
> +test_select_reuseport

Applied, Thanks
