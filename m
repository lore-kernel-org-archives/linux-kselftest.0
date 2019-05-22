From: catalin.marinas@arm.com (Catalin Marinas)
Date: Wed, 22 May 2019 11:56:10 +0100
Subject: [PATCH v15 04/17] mm: add ksys_ wrappers to memory syscalls
In-Reply-To: <55496bc72542ec14c4c8de23a4df235644013911.1557160186.git.andreyknvl@google.com>
References: <cover.1557160186.git.andreyknvl@google.com>
 <55496bc72542ec14c4c8de23a4df235644013911.1557160186.git.andreyknvl@google.com>
Message-ID: <20190522105609.jpmaiq3adyh6apx2@mbp>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190522105610.WXpCznetCAkc25OZ-ap4bP28zkcYX0pk2E6CVXpBGyI@z>

On Mon, May 06, 2019@06:30:50PM +0200, Andrey Konovalov wrote:
> This patch is a part of a series that extends arm64 kernel ABI to allow to
> pass tagged user pointers (with the top byte set to something else other
> than 0x00) as syscall arguments.
> 
> This patch adds ksys_ wrappers to the following memory syscalls:
> 
> brk, get_mempolicy (renamed kernel_get_mempolicy -> ksys_get_mempolicy),
> madvise, mbind (renamed kernel_mbind -> ksys_mbind), mincore,
> mlock (renamed do_mlock -> ksys_mlock), mlock2, mmap_pgoff,
> mprotect (renamed do_mprotect_pkey -> ksys_mprotect_pkey), mremap, msync,
> munlock, munmap, remap_file_pages, shmat, shmdt.
> 
> The next patch in this series will add a custom implementation for these
> syscalls that makes them accept tagged pointers on arm64.
> 
> Signed-off-by: Andrey Konovalov <andreyknvl at google.com>

Reviewed-by: Catalin Marinas <catalin.marinas at arm.com>
