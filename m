From: thuth at redhat.com (Thomas Huth)
Date: Fri, 24 May 2019 20:16:46 +0200
Subject: [PATCH] KVM: selftests: enable pgste option for the linker on s390
In-Reply-To: <20190524103301.87017-1-borntraeger@de.ibm.com>
References: <20190523164309.13345-1-thuth@redhat.com>
 <20190524103301.87017-1-borntraeger@de.ibm.com>
Message-ID: <798bd397-d44f-0076-3f87-ea0214ceb614@redhat.com>

On 24/05/2019 12.33, Christian Borntraeger wrote:
> To avoid testcase failures we need to enable the pgstes. This can be
> done with /proc/sys/vm/allocate_pgste or with a linker option that
> creates an  S390_PGSTE program header.

Oh, right, I initially enabled it on my LPAR via "sysctl
vm.allocate_pgste=1" when I started working on the selftests and then
completely forgot about this... The linker option is certainly the
better way to do this, thanks for the patch!

Reviewed-by: Thomas Huth <thuth at redhat.com>
