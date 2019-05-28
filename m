From: Dave.Martin@arm.com (Dave Martin)
Date: Tue, 28 May 2019 16:56:45 +0100
Subject: [PATCH v15 05/17] arms64: untag user pointers passed to memory
 syscalls
In-Reply-To: <20190528154057.GD32006@arrakis.emea.arm.com>
References: <cover.1557160186.git.andreyknvl@google.com>
 <00eb4c63fefc054e2c8d626e8fedfca11d7c2600.1557160186.git.andreyknvl@google.com>
 <20190527143719.GA59948@MBP.local>
 <20190528145411.GA709@e119886-lin.cambridge.arm.com>
 <20190528154057.GD32006@arrakis.emea.arm.com>
Message-ID: <20190528155644.GD28398@e103592.cambridge.arm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190528155645.6cfMd-UrXzQG1aKswXuHNyeeF6nGyBCWzQ_nSkG-8h4@z>

On Tue, May 28, 2019@04:40:58PM +0100, Catalin Marinas wrote:

[...]

> My thoughts on allowing tags (quick look):
>
> brk - no

[...]

> mlock, mlock2, munlock - yes
> mmap - no (we may change this with MTE but not for TBI)

[...]

> mprotect - yes

I haven't following this discussion closely... what's the rationale for
the inconsistencies here (feel free to refer me back to the discussion
if it's elsewhere).

Cheers
---Dave
