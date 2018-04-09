From: Alexander.Levin at microsoft.com (Sasha Levin)
Date: Mon, 9 Apr 2018 03:36:41 +0000
Subject: [PATCH v2] selftests/android/ion: fix heap_type may be
 uninitialized
In-Reply-To: <20180405073907.30615-1-anders.roxell@linaro.org>
References: <20180405073907.30615-1-anders.roxell@linaro.org>
Message-ID: <DM5PR2101MB1032D911A4D219B49022C307FBBF0@DM5PR2101MB1032.namprd21.prod.outlook.com>

Hi,

[This is an automated email]

This commit has been processed because it contains a "Fixes:" tag,
fixing commit: 47a18c42d992 android/ion: userspace test utility for ion buffer sharing.

The bot has also determined it's probably a bug fixing patch. (score: 30.2608)

The bot has tested the following trees: v4.16, v4.15.15.

v4.16: Build OK!
v4.15.15: Build OK!

--
Thanks,
Sasha--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
