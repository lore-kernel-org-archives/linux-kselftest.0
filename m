From: catalin.marinas@arm.com (Catalin Marinas)
Date: Wed, 22 May 2019 11:41:03 +0100
Subject: [PATCH v15 03/17] lib, arm64: untag user pointers in strn*_user
In-Reply-To: <861418ff7ed7253356cb8267de5ee2d4bd84196d.1557160186.git.andreyknvl@google.com>
References: <cover.1557160186.git.andreyknvl@google.com>
 <861418ff7ed7253356cb8267de5ee2d4bd84196d.1557160186.git.andreyknvl@google.com>
Message-ID: <20190522104103.r5any4us4zz7gwvg@mbp>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190522104103.vdmGYNhxc3VoAlHY7TqplAOzPVwO2t2i-POkZMNgPqE@z>

On Mon, May 06, 2019@06:30:49PM +0200, Andrey Konovalov wrote:
> This patch is a part of a series that extends arm64 kernel ABI to allow to
> pass tagged user pointers (with the top byte set to something else other
> than 0x00) as syscall arguments.
> 
> strncpy_from_user and strnlen_user accept user addresses as arguments, and
> do not go through the same path as copy_from_user and others, so here we
> need to handle the case of tagged user addresses separately.
> 
> Untag user pointers passed to these functions.
> 
> Note, that this patch only temporarily untags the pointers to perform
> validity checks, but then uses them as is to perform user memory accesses.
> 
> Signed-off-by: Andrey Konovalov <andreyknvl at google.com>

Just to keep track of where I am with the reviews while the ABI
discussion continues:

Reviewed-by: Catalin Marinas <catalin.marinas at arm.com>
