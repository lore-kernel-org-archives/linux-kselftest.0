From: kevin.brodsky at arm.com (Kevin Brodsky)
Date: Mon, 18 Mar 2019 13:26:48 +0000
Subject: [PATCH v11 13/14] arm64: update
 Documentation/arm64/tagged-pointers.txt
In-Reply-To: <bf0abceeaf32e6b9cdbc9dde45cc5966b5747ec4.1552679409.git.andreyknvl@google.com>
References: <cover.1552679409.git.andreyknvl@google.com>
 <bf0abceeaf32e6b9cdbc9dde45cc5966b5747ec4.1552679409.git.andreyknvl@google.com>
Message-ID: <81bc3110-b638-4545-1270-26baec3d59e7@arm.com>

On 15/03/2019 19:51, Andrey Konovalov wrote:
> This patch is a part of a series that extends arm64 kernel ABI to allow to
> pass tagged user pointers (with the top byte set to something else other
> than 0x00) as syscall arguments.
>
> Document the ABI changes in Documentation/arm64/tagged-pointers.txt.
>
> Signed-off-by: Andrey Konovalov <andreyknvl at google.com>
> ---
>   Documentation/arm64/tagged-pointers.txt | 18 ++++++++----------
>   1 file changed, 8 insertions(+), 10 deletions(-)
>
> diff --git a/Documentation/arm64/tagged-pointers.txt b/Documentation/arm64/tagged-pointers.txt
> index a25a99e82bb1..07fdddeacad0 100644
> --- a/Documentation/arm64/tagged-pointers.txt
> +++ b/Documentation/arm64/tagged-pointers.txt
> @@ -17,13 +17,15 @@ this byte for application use.
>   Passing tagged addresses to the kernel
>   --------------------------------------
>   
> -All interpretation of userspace memory addresses by the kernel assumes
> -an address tag of 0x00.
> +The kernel supports tags in pointer arguments (including pointers in
> +structures) of syscalls, however such pointers must point to memory ranges
> +obtained by anonymous mmap() or brk().
>   
> -This includes, but is not limited to, addresses found in:
> +The kernel supports tags in user fault addresses. However the fault_address
> +field in the sigcontext struct will contain an untagged address.
>   
> - - pointer arguments to system calls, including pointers in structures
> -   passed to system calls,
> +All other interpretations of userspace memory addresses by the kernel
> +assume an address tag of 0x00, in particular:
>   
>    - the stack pointer (sp), e.g. when interpreting it to deliver a
>      signal,
> @@ -33,11 +35,7 @@ This includes, but is not limited to, addresses found in:
>   
>   Using non-zero address tags in any of these locations may result in an
>   error code being returned, a (fatal) signal being raised, or other modes
> -of failure.
> -
> -For these reasons, passing non-zero address tags to the kernel via
> -system calls is forbidden, and using a non-zero address tag for sp is
> -strongly discouraged.
> +of failure. Using a non-zero address tag for sp is strongly discouraged.

I don't understand why we should keep such a limitation. For MTE, tagging SP is 
something we are definitely considering. This does bother userspace software in some 
rare cases, but I'm not sure in what way it bothers the kernel.

Kevin

>   
>   Programs maintaining a frame pointer and frame records that use non-zero
>   address tags may suffer impaired or inaccurate debug and profiling
