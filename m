From: catalin.marinas@arm.com (Catalin Marinas)
Date: Wed, 22 May 2019 12:56:53 +0100
Subject: [PATCH v15 07/17] mm, arm64: untag user pointers in mm/gup.c
In-Reply-To: <d234cd71774f35229bdfc0a793c34d6712b73093.1557160186.git.andreyknvl@google.com>
References: <cover.1557160186.git.andreyknvl@google.com>
 <d234cd71774f35229bdfc0a793c34d6712b73093.1557160186.git.andreyknvl@google.com>
Message-ID: <20190522115652.nf2r5j6xydywmccw@mbp>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190522115653.muqExarDgI3vCR9e_iljIwNXqQ3axsB4qjww5r2lOGw@z>

On Mon, May 06, 2019@06:30:53PM +0200, Andrey Konovalov wrote:
> This patch is a part of a series that extends arm64 kernel ABI to allow to
> pass tagged user pointers (with the top byte set to something else other
> than 0x00) as syscall arguments.
> 
> mm/gup.c provides a kernel interface that accepts user addresses and
> manipulates user pages directly (for example get_user_pages, that is used
> by the futex syscall). Since a user can provided tagged addresses, we need
> to handle this case.
> 
> Add untagging to gup.c functions that use user addresses for vma lookups.
> 
> Signed-off-by: Andrey Konovalov <andreyknvl at google.com>

Reviewed-by: Catalin Marinas <catalin.marinas at arm.com>
