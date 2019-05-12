From: sdf at fomichev.me (Stanislav Fomichev)
Date: Sat, 11 May 2019 23:29:07 -0700
Subject: [PATCH] selftests: bpf: Add files generated when compiled to
 .gitignore
In-Reply-To: <20190512035009.25451-1-skunberg.kelsey@gmail.com>
References: <20190512035009.25451-1-skunberg.kelsey@gmail.com>
Message-ID: <20190512062907.GL1247@mini-arch>

On 05/11, Kelsey Skunberg wrote:
> The following files are generated when /selftests/bpf/ is compiled and
> should be added to .gitignore:
> 
> 	- libbpf.pc
> 	- libbpf.so.0
> 	- libbpf.so.0.0.3
> 
> Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
> ---
>  tools/testing/selftests/bpf/.gitignore | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/tools/testing/selftests/bpf/.gitignore b/tools/testing/selftests/bpf/.gitignore
> index 41e8a689aa77..ceb11f98fe4f 100644
> --- a/tools/testing/selftests/bpf/.gitignore
> +++ b/tools/testing/selftests/bpf/.gitignore
> @@ -32,3 +32,6 @@ test_tcpnotify_user
>  test_libbpf
>  test_tcp_check_syncookie_user
>  alu32
> +libbpf.pc

[..]
> +libbpf.so.0
> +libbpf.so.0.0.3
How about libbpf.so.* so we don't have to update it on every release?

> --
> 2.20.1
> 
