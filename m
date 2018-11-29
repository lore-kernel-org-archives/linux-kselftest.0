From: catalin.marinas at arm.com (Catalin Marinas)
Date: Thu, 29 Nov 2018 18:24:48 +0000
Subject: [PATCH v8 3/8] arm64: untag user addresses in access_ok and
 __uaccess_mask_ptr
In-Reply-To: <b23c2374235a33328817f2586cc055c69d91a2ec.1541687720.git.andreyknvl@google.com>
References: <cover.1541687720.git.andreyknvl@google.com>
 <b23c2374235a33328817f2586cc055c69d91a2ec.1541687720.git.andreyknvl@google.com>
Message-ID: <20181129182446.GJ22027@arrakis.emea.arm.com>

On Thu, Nov 08, 2018 at 03:36:10PM +0100, Andrey Konovalov wrote:
> copy_from_user (and a few other similar functions) are used to copy data
> from user memory into the kernel memory or vice versa. Since a user can
> provided a tagged pointer to one of the syscalls that use copy_from_user,
> we need to correctly handle such pointers.
> 
> Do this by untagging user pointers in access_ok and in __uaccess_mask_ptr,
> before performing access validity checks.
> 
> Signed-off-by: Andrey Konovalov <andreyknvl at google.com>

Reviewed-by: Catalin Marinas <catalin.marinas at arm.com>
