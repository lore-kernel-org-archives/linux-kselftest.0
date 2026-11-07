Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794023184;
	b=T201RDD+Cxklr8Xpz1bm4GPl34WuHQUKvM9eSyWfWyaUARiczWBS/m6bGNFOjnrx3xi+
	 vPdV50neKkvLa/rRtOZ8DFXw0GRpB+Gsa9druRF+KbxCHe2OWb/RFMEkNTZEz39NOBEGV
	 BGcHF8yFTO8xtApx2AZcApZP/NsbajRtUtHtipES/kvS09z/B2GZWMW83P4BPt//dVEBI
	 pVxbQfPhG5XX0wf0ZwvqgOjQ4T4YvNMCy06hDuYDmwGk46y/MsT6Pt91MSHDPUh1jUUbm
	 LVkpggTZ+YwJtCwwPp0CADdX7yvefti00p0SHb7QbqEQDJPAxpSmlWAa+r+L2HlcS/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794023184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:From:To:Cc:Subject:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=fqz4qN+BLKAsTg3hFdIueZvqPQrOf/Q5VzzyopjCcFA=;
	b=mXwyduYoLA1Ak82W/EP8yOkn4utHDGyi6LzC43b28vb0zBl4Hnjwpe+INLADkNtc6ZxP
	 Jelc6E+MCNuAOb9XhpNUboeP7M5F8DVwf8ufMZFxfrq9D5GKtEoBHjUpPSUx0AYm63TXS
	 egE42Hlsn+kMCDkT4UBNVNaxcf/4zp21wo3TkwZhTaLywHkd1kIdqkZzZj+CsMlDMJ/Bu
	 kXNAHIrHOZAOKlixbuShsGF0CagQrdp8e9qbj6jaxWYxiUEAgsJaqHetzPgyoL3d2MR7Q
	 6PVngLvyjBZna0A4ZYCYsZ+68JlN0MxrPb/ANEbPdyrXAkH28qfHwsq4R9soY9X8YdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wvWndcBQ;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E131E606A32D
	for <linux-kselftest@vger.kernel.org>; Sat,  7 Nov 2026 03:46:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E131E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wvWndcBQ
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e9995ce866so9494405ad.0
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 19:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794023182; x=1794627982; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fqz4qN+BLKAsTg3hFdIueZvqPQrOf/Q5VzzyopjCcFA=;
        b=wvWndcBQ1TgGm4c5X7adPMbmtQszekxX63DaFxEE9f5Frdl/3y2XSIYQneLBLOd3pL
         T81jpOtY7fwKh76/x1jvnFwDTBMiWkK5v3XO3vepfvoOvHcoh96lyc7Z5nMRwfb/bgR1
         oYffdyzikpN1U7+kcfxuWAYJztMekLz4NbRSNZM8Kt7gxoSLJGgbMT0VAzccqMSB0OKy
         AXMewEeWfPgmANG1pYUlTMZzrJpGqRnTJS7HI5nMZebnkv7TytgnsCOq9MmBEPfrr/Vm
         eLH34heLkA2B9I0kA0WypRpxi1sYnpMEK8F5a/JLNeYgXvc4RKLQnwMgAhFUjPXhjh3r
         o2sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794023182; x=1794627982;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fqz4qN+BLKAsTg3hFdIueZvqPQrOf/Q5VzzyopjCcFA=;
        b=l41PkFyvoLkXKjuKNH3t+U78JJAlWcM3bf7yfaMVWUMs69yjgaVYHtMrhDB9JEIbmX
         FNKqZIFQT8WeJsQ53Nj4y5a5/3+mk2CwcOCKdn1fwy/UJlHTtGrunEhFUs8lYk5G0eOy
         TH01wM2JjYxGUTHy2J1XibHYz1hU9F76GZ7pwTvuTikR6Q1ZOG1ryYmZkkIbSCRO0qBB
         BGeIO7dTiLtPrwyglgE5ax12k6+dVRiHy0bQAzpSMvBlN7lM4AMudKcSFMQlafvGirrV
         8M6a5LlL8R9OXEnPM7GByAfR4Q1uQknrYEfgEJ4yi2NXOtJQzLvA5YR0sl9QwC4+riIo
         6gKw==
X-Forwarded-Encrypted: i=1; AL+hErHEXHz0w8ozJ+F1k5EEuoWv/BVglSrTYvrYduHZq/1hlLByw9540FJS4r+J96S0i2riZvZ11VyQ/UcSsrCuGHI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8oFEIUFSPiPMeeXiRsHwibNSsB532NTilvODqnq2HQkzXeLhPL
	OycbRyhOq1nCpRpoAXKuCENZyCTu53q9ziqMpD+1LJjII3wrsen/xohQodF2Dw==
X-Gm-Gg: AYBFou2UEtzmhVGDYs8ri1z4rdAz8u3Ly5oax345QrmhyLxtF/fcwKZH45HBjEO/nQ1
	S2X5zJ89ngj43abEf24bRXv1XNE2/FhXCT/p9mN84SyuoYSNADe8hyOM7A1EA9diNJEZ3NUGtbq
	138W79N2K1gKJgJ/uMPV1V3YHonhXh3A70PQd11GSmQhPsegM7t3a9eQ9zr6aqKz/EGF+9tgckp
	S58p0oF5t8YyEGyFF5FnGEvrWIqaSvDom0bhezpYgfKk1eRwsUGyIW3gmnyxDMmQ7g2c7iPd1jD
	uRaVNiMLHthCGBO2kUNJZBQnq03oUHdLkgpf783SdZRQ7GRH/q6n1lk+y0dElapQkx7O4Z2Wesj
	6RRj9O5EtR/SCuIPVCLHA4XUHSJC5YNHlERBg/YT49bkJXj4YEuGqF/oXfHjE4W+wcptE48gzpL
	imZXqg9jXnI6ghjFmBGt74W2iVS1tkbn6ol/vuDftkynItvciMaQAxktFdi8kyqhSRnYbHuG1lo
	zcx3Dur6d2qmjXgiYwAbU9JIwOP2PkJgVkwxG0arpbk9vRm5baXSUEjES3AOcbW/Htg93GTokCT
	TE+o+qXWxgUswrMX1skFcSE803Ggy8JhC3n7N08iHnxZoqBAZMLe84JQtMncesi31qobNhIAj6S
	kBEHbPK1uinEoIfFwNe+QQC7ZSI4VNUStMg==
X-Received: by 2002:a17:90a:da8e:b0:3b0:94e6:4364 with SMTP id 98e67ed59e1d1-3b0db70b25bmr4358253a91.64.1794023182095;
        Fri, 06 Nov 2026 19:46:22 -0800 (PST)
Received: from localhost ([153.61.198.243])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb70ab7620sm1090942a12.29.2026.11.06.19.46.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 19:46:21 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 07 Nov 2026 03:46:21 +0000
Message-Id: <DMOO53QTDUQ4.2Z9UXMZEPX568@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Hungyu Lin" <dennylin0707@gmail.com>, <bpf@vger.kernel.org>
Cc: <andrii@kernel.org>, <qmo@kernel.org>, <daniel@iogearbox.net>,
 <yonghong.song@linux.dev>, <eddyz87@gmail.com>, <ihor.solodrai@linux.dev>,
 <shuah@kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v4 0/3] Normalize enum values in libbpf and
 bpftool
In-Reply-To: <20261107020725.36675-1-dennylin0707@gmail.com>
References: <20261107020725.36675-1-dennylin0707@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, Nov 06, 2026 at 06:07 PM Hungyu Lin <dennylin0707@gmail.com> wrote:
>  .../bpf/prog_tests/bpftool_map_dump.c         | 162 ++++++++++++++++++
>  .../selftests/bpf/prog_tests/btf_dump.c       |  77 +++++++++
>  .../selftests/bpf/prog_tests/map_extra.c      |  19 ++
>  .../selftests/bpf/progs/test_map_extra.c      |  12 ++
>  8 files changed, 293 insertions(+), 10 deletions(-)

selftest are growing too fast.

16 subtests create 16 maps and run bpftool 32 times.
9 of the 16 pass without the fix.
Plain and json output come from the same btf_dumper_enum().
One map with a struct of four enums and one run of bpftool are enough.

The btf_dump.c part below is the test from my reply to the libbpf patch.

Keep patches 1 and 2. Keep the map_extra test.

Instead of the other two files of patch 3 (not even compile tested):

diff --git a/tools/testing/selftests/bpf/prog_tests/bpftool_map_dump.c b/tools/testing/selftests/bpf/prog_tests/bpftool_map_dump.c
index 187b3f7..1c581db 100644
--- a/tools/testing/selftests/bpf/prog_tests/bpftool_map_dump.c
+++ b/tools/testing/selftests/bpf/prog_tests/bpftool_map_dump.c
@@ -7,6 +7,7 @@

 #define PIN_PATH	"/sys/fs/bpf/test_bpftool_map_dump_sk_storage"
 #define QUEUE_PIN_PATH	"/sys/fs/bpf/test_bpftool_map_dump_queue"
+#define ENUM_PIN_PATH	"/sys/fs/bpf/test_bpftool_map_dump_enum"
 #define JSON_ERROR	"{\"error\":\"can't dump sk_storage map"

 /* An empty socket storage map with an int value. */
@@ -124,10 +125,85 @@ out:
 	close(map_fd);
 }

+struct enums {
+	__u8 u8_name;
+	__s8 s8_name;
+	__u32 u32_num;
+	__u64 u64_num;
+};
+
+/* An array map. Its value is struct enums with an enum behind every member. */
+static int create_enum_map(void)
+{
+	LIBBPF_OPTS(bpf_map_create_opts, opts);
+	struct btf *btf;
+	int fd = -1;
+
+	btf = btf__new_empty();
+	if (!ASSERT_OK_PTR(btf, "btf__new_empty"))
+		return -1;
+
+	btf__add_int(btf, "int", 4, BTF_INT_SIGNED);	/* [1] */
+	btf__add_enum(btf, "u8", 1);			/* [2] */
+	btf__add_enum_value(btf, "U8_MAX", 0xff);
+	btf__add_enum(btf, "s8", 1);			/* [3] */
+	btf__add_enum_value(btf, "S8_NEG", -1);
+	btf__add_enum(btf, "u32", 4);			/* [4] */
+	btf__add_enum_value(btf, "U32_ONE", 1);
+	btf__add_enum64(btf, "u64", 8, false);		/* [5] */
+	btf__add_enum64_value(btf, "U64_ONE", 1);
+	btf__add_struct(btf, "enums", sizeof(struct enums));	/* [6] */
+	btf__add_field(btf, "u8_name", 2, 0, 0);
+	btf__add_field(btf, "s8_name", 3, 8, 0);
+	btf__add_field(btf, "u32_num", 4, 32, 0);
+	btf__add_field(btf, "u64_num", 5, 64, 0);
+	if (!ASSERT_OK(btf__load_into_kernel(btf), "btf__load_into_kernel"))
+		goto out;
+
+	opts.btf_fd = btf__fd(btf);
+	opts.btf_key_type_id = 1;
+	opts.btf_value_type_id = 6;
+	fd = bpf_map_create(BPF_MAP_TYPE_ARRAY, "enums", sizeof(int),
+			    sizeof(struct enums), 1, &opts);
+	ASSERT_OK_FD(fd, "bpf_map_create");
+out:
+	btf__free(btf);
+	return fd;
+}
+
+static void test_enum(void)
+{
+	struct enums value = { 0xff, -1, (__u32)-22, (1ULL << 63) | 1 };
+	char output[1024] = {};
+	int map_fd, key = 0, ret;
+
+	map_fd = create_enum_map();
+	if (map_fd < 0)
+		return;
+	if (!ASSERT_OK(bpf_map_update_elem(map_fd, &key, &value, BPF_ANY),
+		       "update map"))
+		goto out;
+	if (!ASSERT_OK(bpf_obj_pin(map_fd, ENUM_PIN_PATH), "pin map"))
+		goto out;
+
+	ret = get_bpftool_command_output("-j map dump pinned " ENUM_PIN_PATH,
+					 output, sizeof(output));
+	ASSERT_OK(ret, "json dump");
+	ASSERT_HAS_SUBSTR(output,
+			  "{\"u8_name\":\"U8_MAX\",\"s8_name\":\"S8_NEG\","
+			  "\"u32_num\":4294967274,\"u64_num\":9223372036854775809}",
+			  "enum values");
+out:
+	unlink(ENUM_PIN_PATH);
+	close(map_fd);
+}
+
 void test_bpftool_map_dump(void)
 {
 	if (test__start_subtest("sk_storage"))
 		test_sk_storage();
 	if (test__start_subtest("queue"))
 		test_queue();
+	if (test__start_subtest("enum"))
+		test_enum();
 }
diff --git a/tools/testing/selftests/bpf/prog_tests/btf_dump.c b/tools/testing/selftests/bpf/prog_tests/btf_dump.c
index bfa74db..f126fe3 100644
--- a/tools/testing/selftests/bpf/prog_tests/btf_dump.c
+++ b/tools/testing/selftests/bpf/prog_tests/btf_dump.c
@@ -944,6 +944,9 @@ static void test_btf_dump_typedef_data(struct btf *btf, struct btf_dump *d,
 static void test_btf_dump_enum_data(struct btf *btf, struct btf_dump *d,
 				    char *str)
 {
+	__u32 high = 0x80000000;
+	__s32 neg = -1;
+
 	/* enum where enum value does (and does not) exist */
 	TEST_BTF_DUMP_DATA_C(btf, d, "enum", str, enum bpf_cmd, BTF_F_COMPACT,
 			     BPF_MAP_CREATE);
@@ -975,6 +978,22 @@ static void test_btf_dump_enum_data(struct btf *btf, struct btf_dump *d,

 	TEST_BTF_DUMP_DATA_OVER(btf, d, "enum", str, enum bpf_cmd,
 				sizeof(enum bpf_cmd) - 1, "", BPF_MAP_CREATE);
+
+	/* enumerators with bit 31 set in unsigned and in signed enum */
+	ASSERT_GT(btf__add_enum(btf, "test_enum_u32", 4), 0, "add unsigned enum");
+	ASSERT_OK(btf__add_enum_value(btf, "TEST_ENUM_HIGH", 0x80000000), "add TEST_ENUM_HIGH");
+	ASSERT_GT(btf__add_enum(btf, "test_enum_s32", 4), 0, "add signed enum");
+	ASSERT_OK(btf__add_enum_value(btf, "TEST_ENUM_NEG", -1), "add TEST_ENUM_NEG");
+
+	/* btf_dump__dump_type_data() doesn't resize 'd' for the new types */
+	d = btf_dump__new(btf, btf_dump_snprintf, str, NULL);
+	if (!ASSERT_OK_PTR(d, "btf_dump__new"))
+		return;
+	ASSERT_OK(btf_dump_data(btf, d, "test_enum_u32", NULL, 0, &high, 4, str,
+				"(enum test_enum_u32)TEST_ENUM_HIGH"), "dump unsigned enum");
+	ASSERT_OK(btf_dump_data(btf, d, "test_enum_s32", NULL, 0, &neg, 4, str,
+				"(enum test_enum_s32)TEST_ENUM_NEG"), "dump signed enum");
+	btf_dump__free(d);
 }

 static void test_btf_dump_struct_data(struct btf *btf, struct btf_dump *d,

pw-bot: cr
