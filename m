From: alexander.levin at verizon.com (alexander.levin at verizon.com)
Date: Thu, 30 Nov 2017 21:34:37 +0000
Subject: [Linux-kselftest-mirror] [PATCH AUTOSEL for 4.9 04/52]
 x86/selftests: Add clobbers for int80 on x86_64
In-Reply-To: <CAJwJo6ZCnqTmzxO0xTxMEEy3t+0Z2-1dvwtn_THCO_OP2_MLcQ@mail.gmail.com>
References: <20171129172100.28819-1-alexander.levin@verizon.com>
 <20171129172100.28819-4-alexander.levin@verizon.com>
 <CAJwJo6ZCnqTmzxO0xTxMEEy3t+0Z2-1dvwtn_THCO_OP2_MLcQ@mail.gmail.com>
Message-ID: <20171130213436.usa4ikw6in42vf6h@sasha-lappy>

On Wed, Nov 29, 2017 at 05:42:25PM +0000, Dmitry Safonov wrote:
>Hi Sasha,
>
>I would object including this to stable tree:
>1. It's selftest fixup
>2. I have never saw selftests failing because of it (but it's possible)
>    I saw this in CRIU (Checkpoint Restore In Userspace) project
>    triggering, so I've fixed the selftests, mostly for documentation
>    reasons - as people in userspace can reuse this code and think
>    it's good and will just work after copy-paste (which is not the case).
>
>So, this patch doesn't look urgent to include it in -stable kernel.

Hey Dmitry,

We try to backport selftest patches as stable material to allow a
"complete" selftest to run on stable kernels.

-- 

Thanks,
Sasha--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
