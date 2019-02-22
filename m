From: patch-notifications@ellerman.id.au (Michael Ellerman)
Date: Fri, 22 Feb 2019 20:47:39 +1100 (AEDT)
Subject: powerpc/selftest: fix type of mftb() in null_syscall
In-Reply-To: <3c3638c1ece313ad3fa0a850f9a98a635ebe688a.1548165236.git.christophe.leroy@c-s.fr>
Message-ID: <445RMv3S7Gz9sB8@ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190222094739.ZGgjwphW9dtGjc3Gv0WYpz61SqNXkgpElM4X7T9geuM@z>

On Tue, 2019-01-22@13:54:57 UTC, Christophe Leroy wrote:
> All callers of mftb() expect 'unsigned long', and the function itself
> only returns lower part of the TB so it really is 'unsigned long'
> not 'unsigned long long'
> 
> Signed-off-by: Christophe Leroy <christophe.leroy at c-s.fr>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/beb4f4722cf60d9f0803054dec4eb502

cheers
