From: patch-notifications@ellerman.id.au (Michael Ellerman)
Date: Fri, 22 Feb 2019 20:47:50 +1100 (AEDT)
Subject: tools/selftest/vm: allow choosing mem size and page size in
 map_hugetlb
In-Reply-To: <59dbb1bc305068dd0fe8e2d5a75c4213e0134549.1549638049.git.christophe.leroy@c-s.fr>
Message-ID: <445RN711R5z9sNG@ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190222094750.FsYek5wcJ-jBGs09uKrevmcRp-434m8UEgAwb12aQ5k@z>

On Fri, 2019-02-08@15:02:55 UTC, Christophe Leroy wrote:
> map_hugetlb maps 256Mbytes of memory with default hugepage size.
> 
> This patch allows the user to pass the size and page shift as an
> argument in order to use different size and page size.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy at c-s.fr>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/fa7b9a805c797b729022029aaa3a2b7c

cheers
