From: sdf@fomichev.me (Stanislav Fomichev)
Date: Fri, 15 Mar 2019 13:08:47 -0700
Subject: [PATCH net-next] selftests: bpf: modify urandom_read and link it
 non-statically
In-Reply-To: <20190315200414.32346-1-ivecera@redhat.com>
References: <20190315200414.32346-1-ivecera@redhat.com>
Message-ID: <20190315200847.GC5481@mini-arch.hsd1.ca.comcast.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190315200847.9yBXnYB96-FWn4MjVUTdBfjXtJ1Ip0c_DtHXoDmtEfM@z>

On 03/15, Ivan Vecera wrote:
> After some experiences I found that urandom_read does not need to be
> linked statically. When the 'read' syscall call is moved to separate
> non-inlined function then bpf_get_stackid() is able to find
> the executable in stack trace and extract its build_id from it.
But why? Do you have some problems with it being linked statically?

> 
> Signed-off-by: Ivan Vecera <ivecera at redhat.com>
> ---
>  tools/testing/selftests/bpf/Makefile       |  2 +-
>  tools/testing/selftests/bpf/urandom_read.c | 15 +++++++++++----
>  2 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
> index 2aed37ea61a4..c33900a8fec0 100644
> --- a/tools/testing/selftests/bpf/Makefile
> +++ b/tools/testing/selftests/bpf/Makefile
> @@ -69,7 +69,7 @@ TEST_CUSTOM_PROGS = $(OUTPUT)/urandom_read
>  all: $(TEST_CUSTOM_PROGS)
>  
>  $(OUTPUT)/urandom_read: $(OUTPUT)/%: %.c
> -	$(CC) -o $@ -static $< -Wl,--build-id
> +	$(CC) -o $@ $< -Wl,--build-id
>  
>  BPFOBJ := $(OUTPUT)/libbpf.a
>  
> diff --git a/tools/testing/selftests/bpf/urandom_read.c b/tools/testing/selftests/bpf/urandom_read.c
> index 9de8b7cb4e6d..db781052758d 100644
> --- a/tools/testing/selftests/bpf/urandom_read.c
> +++ b/tools/testing/selftests/bpf/urandom_read.c
> @@ -7,11 +7,19 @@
>  
>  #define BUF_SIZE 256
>  
> +static __attribute__((noinline))
> +void urandom_read(int fd, int count)
> +{
> +       char buf[BUF_SIZE];
> +       int i;
> +
> +       for (i = 0; i < count; ++i)
> +               read(fd, buf, BUF_SIZE);
> +}
> +
>  int main(int argc, char *argv[])
>  {
>  	int fd = open("/dev/urandom", O_RDONLY);
> -	int i;
> -	char buf[BUF_SIZE];
>  	int count = 4;
>  
>  	if (fd < 0)
> @@ -20,8 +28,7 @@ int main(int argc, char *argv[])
>  	if (argc == 2)
>  		count = atoi(argv[1]);
>  
> -	for (i = 0; i < count; ++i)
> -		read(fd, buf, BUF_SIZE);
> +	urandom_read(fd, count);
>  
>  	close(fd);
>  	return 0;
> -- 
> 2.19.2
> 
