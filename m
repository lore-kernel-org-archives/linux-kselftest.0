From: torvalds@linux-foundation.org (Linus Torvalds)
Date: Mon, 16 Apr 2018 10:43:07 -0700
Subject: Linux 4.17-rc1 - kernel paging errors running x86 selftests
In-Reply-To: <1dcd116c-9384-6885-2d9e-f620c14bd955@osg.samsung.com>
References: <1dcd116c-9384-6885-2d9e-f620c14bd955@osg.samsung.com>
Message-ID:
 <CA+55aFwE1SR87+Xkkmfr+D0Yq3R0HRkdf1GdgScEfXXWN4ba6w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180416174307.9kHdsLwrALaaGUHCb29hp8iLg2zPx_tnics9-_cX78o@z>

On Mon, Apr 16, 2018@10:01 AM, Shuah Khan <shuahkh@osg.samsung.com> wrote:
>
> [  884.496588] BUG: unable to handle kernel paging request at fffffe8000010030

This is the LDT remap area.

> [  884.496614] Oops: 0009 [#1] SMP KASAN PTI

This is RSVD + P, so it's a system read access that got a protection
fault due to reserved bits.

> [  884.496741] RIP: 0033:0x4031c2
> [  884.496745] RSP: 002b:00007ffd805b56d8 EFLAGS: 00010246

This is not actually a kernel paging request, it's all user space, but
it's user space that does a system access.

That's normal - something loading a segment in user space, and thus
accessing the system LDT.

But:

> [  884.496601] PGD 372870067 P4D 372870067 PUD 346e84067 PMD 34005f067 PTE ffffffffffffffff

WTF? What's that odd bogus PTE entry?

That's also why it gets a RSVD fault. That's just garbage. All-ones is
not a valid PTE.

The other levels look valid, although it strikes me that maybe we
shouldn't have the user bit set in the kernel page tables. I realize
that we clear it at the leaf node, but..

So the user page table is somehow badly set up.

I don't see *why* it would be badly set up, and that test works fine
for me, though.

It doesn't seem to have anything to do with KASAN, although

> [  884.650095] BUG: unable to handle kernel paging request at fffffe8000000000
> [  884.650103] PGD 363699067 P4D 363699067 PUD 3371c6067 PMD 37cfbc067 PTE ffffffffffffffff
> [  884.650112] Oops: 0009 [#2] SMP KASAN PTI
> [  884.650200] RIP: 0033:0x401471
> [  884.650203] RSP: 002b:00007fc8e6775eb0 EFLAGS: 00010206

The other one is exactly the same thing.

                 Linus
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
