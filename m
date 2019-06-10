From: catalin.marinas@arm.com (Catalin Marinas)
Date: Mon, 10 Jun 2019 15:29:34 +0100
Subject: [PATCH v16 07/16] mm, arm64: untag user pointers in
 get_vaddr_frames
In-Reply-To: <da1d0e0f6d69c15a12987379e372182f416cbc02.1559580831.git.andreyknvl@google.com>
References: <cover.1559580831.git.andreyknvl@google.com>
 <da1d0e0f6d69c15a12987379e372182f416cbc02.1559580831.git.andreyknvl@google.com>
Message-ID: <20190610142933.GC10165@c02tf0j2hf1t.cambridge.arm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190610142934.FV7gsc3ZezA_16uEO2eT7MeIyOFs3bi7C5BfDQvXs5w@z>

On Mon, Jun 03, 2019@06:55:09PM +0200, Andrey Konovalov wrote:
> This patch is a part of a series that extends arm64 kernel ABI to allow to
> pass tagged user pointers (with the top byte set to something else other
> than 0x00) as syscall arguments.
> 
> get_vaddr_frames uses provided user pointers for vma lookups, which can
> only by done with untagged pointers. Instead of locating and changing
> all callers of this function, perform untagging in it.
> 
> Signed-off-by: Andrey Konovalov <andreyknvl at google.com>

Acked-by: Catalin Marinas <catalin.marinas at arm.com>
