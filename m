From: jiri@resnulli.us (Jiri Pirko)
Date: Mon, 27 Nov 2017 17:59:45 +0100
Subject: [Linux-kselftest-mirror] [PATCH 2/2] [RFC] packet: experimental
 support for 64-bit timestamps
In-Reply-To: <20171127162001.4055813-2-arnd@arndb.de>
References: <20171127162001.4055813-1-arnd@arndb.de>
 <20171127162001.4055813-2-arnd@arndb.de>
Message-ID: <20171127165945.GC1971@nanopsycho.orion>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20171127165945.BgiCBM-B6BYkl-OFzRrcyCAZTphdYMuE-UnZZcwA0_M@z>

Mon, Nov 27, 2017@05:19:25PM CET, arnd@arndb.de wrote:
>I tried to figure out what it would take to do a version 4 mmap packet
>socket interface to completely avoid the y2106 overflow problem. This is
>what I came up with, reusing most of the v3 code, except for the parts
>where we access the timestamps.
>
>For kselftest, I'm adding support for testing v4 in addition to v1-v3,
>but the test currently does not look at the timestamps, so it won't
>check that the timestamp format actually works as intended, only that
>I didn't break the parts that worked in the v3 selftest.
>
>Overall, this is more of a mess than I expected, so it's probably not
>worth doing a v4 format just for the timestamp, but the patch can serve
>as a reference for anyone that needs a new format for other reasons and
>fixes this along with the other changes.
>
>Signed-off-by: Arnd Bergmann <arnd at arndb.de>
>---

[...]


>@@ -250,7 +269,8 @@ struct tpacket_block_desc {
> enum tpacket_versions {
> 	TPACKET_V1,
> 	TPACKET_V2,
>-	TPACKET_V3
>+	TPACKET_V3,
>+	TPACKET_V4,

I wonder with how many versions are we going to eventually end up with :O
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
