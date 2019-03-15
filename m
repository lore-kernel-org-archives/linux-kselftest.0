From: eric.dumazet@gmail.com (Eric Dumazet)
Date: Fri, 15 Mar 2019 13:03:30 -0700
Subject: [PATCH v11 08/14] net, arm64: untag user pointers in
 tcp_zerocopy_receive
In-Reply-To: <56d3373c1c5007d776fcd5de4523f4b9da341fb6.1552679409.git.andreyknvl@google.com>
References: <cover.1552679409.git.andreyknvl@google.com>
 <56d3373c1c5007d776fcd5de4523f4b9da341fb6.1552679409.git.andreyknvl@google.com>
Message-ID: <04c5b2de-7fde-7625-9d42-228160879ea0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190315200330.9z6q4UO0R3SVav38T8veutdcaXWJeOFMsh7uc9LWLSI@z>



On 03/15/2019 12:51 PM, Andrey Konovalov wrote:
> This patch is a part of a series that extends arm64 kernel ABI to allow to
> pass tagged user pointers (with the top byte set to something else other
> than 0x00) as syscall arguments.
> 
> tcp_zerocopy_receive() uses provided user pointers for vma lookups, which
> can only by done with untagged pointers.
> 
> Untag user pointers in this function.
> 
> Signed-off-by: Andrey Konovalov <andreyknvl at google.com>
> ---
>  net/ipv4/tcp.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
> index 6baa6dc1b13b..89db3b4fc753 100644
> --- a/net/ipv4/tcp.c
> +++ b/net/ipv4/tcp.c
> @@ -1758,6 +1758,8 @@ static int tcp_zerocopy_receive(struct sock *sk,
>  	int inq;
>  	int ret;
>  
> +	address = untagged_addr(address);
> +
>  	if (address & (PAGE_SIZE - 1) || address != zc->address)

The second test will fail, if the top bits are changed in address but not in zc->address

>  		return -EINVAL;
>  
> 
