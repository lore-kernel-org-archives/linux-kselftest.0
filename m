From: catalin.marinas at arm.com (Catalin Marinas)
Date: Wed, 22 May 2019 12:51:39 +0100
Subject: [PATCH v15 06/17] mm: untag user pointers in do_pages_move
In-Reply-To: <474b3c113edae1f2fa679dc7237ec070ff4efb70.1557160186.git.andreyknvl@google.com>
References: <cover.1557160186.git.andreyknvl@google.com>
 <474b3c113edae1f2fa679dc7237ec070ff4efb70.1557160186.git.andreyknvl@google.com>
Message-ID: <20190522115138.52ew2totjd6i4aaq@mbp>

On Mon, May 06, 2019 at 06:30:52PM +0200, Andrey Konovalov wrote:
> This patch is a part of a series that extends arm64 kernel ABI to allow to
> pass tagged user pointers (with the top byte set to something else other
> than 0x00) as syscall arguments.
> 
> do_pages_move() is used in the implementation of the move_pages syscall.
> 
> Untag user pointers in this function.
> 
> Signed-off-by: Andrey Konovalov <andreyknvl at google.com>

Reviewed-by: Catalin Marinas <catalin.marinas at arm.com>
