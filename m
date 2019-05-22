From: catalin.marinas@arm.com (Catalin Marinas)
Date: Wed, 22 May 2019 13:09:07 +0100
Subject: [PATCH v15 09/17] fs, arm64: untag user pointers in
 copy_mount_options
In-Reply-To: <ac2ca3454b1ae8856ea2e29a1316fea50a30c788.1557160186.git.andreyknvl@google.com>
References: <cover.1557160186.git.andreyknvl@google.com>
 <ac2ca3454b1ae8856ea2e29a1316fea50a30c788.1557160186.git.andreyknvl@google.com>
Message-ID: <20190522120907.tf3tb3h5oxhfokgw@mbp>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190522120907.mgdBaZUuZvzxE75I04lZXdgaxOSTUMf2W7gwHa6Gyf0@z>

On Mon, May 06, 2019@06:30:55PM +0200, Andrey Konovalov wrote:
> This patch is a part of a series that extends arm64 kernel ABI to allow to
> pass tagged user pointers (with the top byte set to something else other
> than 0x00) as syscall arguments.
> 
> In copy_mount_options a user address is being subtracted from TASK_SIZE.
> If the address is lower than TASK_SIZE, the size is calculated to not
> allow the exact_copy_from_user() call to cross TASK_SIZE boundary.
> However if the address is tagged, then the size will be calculated
> incorrectly.
> 
> Untag the address before subtracting.
> 
> Signed-off-by: Andrey Konovalov <andreyknvl at google.com>

Reviewed-by: Catalin Marinas <catalin.marinas at arm.com>
