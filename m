From: pbonzini at redhat.com (Paolo Bonzini)
Date: Mon, 26 Nov 2018 18:07:48 +0100
Subject: [PATCH] kvm: selftests: fix spelling mistake "begining" ->
 "beginning"
In-Reply-To: <20181126160814.27473-1-colin.king@canonical.com>
References: <20181126160814.27473-1-colin.king@canonical.com>
Message-ID: <32223cfb-45a8-5188-8158-f387a069aa35@redhat.com>

On 26/11/18 17:08, Colin King wrote:
> From: Colin Ian King <colin.king at canonical.com>
> 
> The text in a TEST_ASSERT message contains a spelling mistake, fix it.
> 
> Signed-off-by: Colin Ian King <colin.king at canonical.com>
> ---
>  tools/testing/selftests/kvm/lib/elf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kvm/lib/elf.c b/tools/testing/selftests/kvm/lib/elf.c
> index 5eb857584aa3..53c48f7587d3 100644
> --- a/tools/testing/selftests/kvm/lib/elf.c
> +++ b/tools/testing/selftests/kvm/lib/elf.c
> @@ -141,7 +141,7 @@ void kvm_vm_elf_load(struct kvm_vm *vm, const char *filename,
>  		offset = hdr.e_phoff + (n1 * hdr.e_phentsize);
>  		offset_rv = lseek(fd, offset, SEEK_SET);
>  		TEST_ASSERT(offset_rv == offset,
> -			"Failed to seek to begining of program header %u,\n"
> +			"Failed to seek to beginning of program header %u,\n"
>  			"  filename: %s\n"
>  			"  rv: %jd errno: %i",
>  			n1, filename, (intmax_t) offset_rv, errno);
> 

Queued, thanks.

Paolo
