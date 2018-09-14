From: pbonzini at redhat.com (Paolo Bonzini)
Date: Fri, 14 Sep 2018 19:38:04 +0200
Subject: [PATCH]] kvm: selftests: use -pthread instead of -lpthread
In-Reply-To: <1535526248-3759-1-git-send-email-Lei.Yang@windriver.com>
References: <1535526248-3759-1-git-send-email-Lei.Yang@windriver.com>
Message-ID: <6955862a-e192-fbfd-3ff3-cac7d70f02d0@redhat.com>

On 29/08/2018 09:04, Lei Yang wrote:
> I run into the following error
> 
> testing/selftests/kvm/dirty_log_test.c:285: undefined reference to `pthread_create'
> testing/selftests/kvm/dirty_log_test.c:297: undefined reference to `pthread_join'
> collect2: error: ld returned 1 exit status
> 
> my gcc version is gcc version 4.8.4
> "-pthread" would work everywhere
> 
> Signed-off-by: Lei Yang <Lei.Yang at windriver.com>
> ---
>  tools/testing/selftests/kvm/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
> index 03b0f55..48c970c 100644
> --- a/tools/testing/selftests/kvm/Makefile
> +++ b/tools/testing/selftests/kvm/Makefile
> @@ -20,7 +20,7 @@ INSTALL_HDR_PATH = $(top_srcdir)/usr
>  LINUX_HDR_PATH = $(INSTALL_HDR_PATH)/include/
>  LINUX_TOOL_INCLUDE = $(top_srcdir)tools/include
>  CFLAGS += -O2 -g -std=gnu99 -I$(LINUX_TOOL_INCLUDE) -I$(LINUX_HDR_PATH) -Iinclude -I$(<D) -I..
> -LDFLAGS += -lpthread
> +LDFLAGS += -pthread
>  
>  # After inclusion, $(OUTPUT) is defined and
>  # $(TEST_GEN_PROGS) starts with $(OUTPUT)/
> 

Queued, thanks.

Paolo
