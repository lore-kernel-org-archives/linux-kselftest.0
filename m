Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795655552;
	b=B9awNxehfzYUWNLbpGhrf9zFiWjxuZZw5zh8qZZ6MvV6CC6f0FpH6qKrNN2+u8wZYbDg
	 7RqBfEYR9jRZ/8bRL9lJHRWHF4dLPuweD08EneHE2Wd3OnMRjuTPkVlWLWd/qb1yaBFPt
	 m4MkgbAdQO6j1sipBRFRejgye5NmZ7ZJABwzwx7Xfisq9M+7KHkriTHA3L4bOTo72UsN4
	 hf7qNxGkrd1og63bUiK7koJ1yQAFrS9QzL6+6htxHl2Qnl32poPO9q1WY9wkRH6WLnXBh
	 H9gRymTr52XirwOzZk+TMje9f6N1TUzBJWsHs98N9bxM7otEx9Uv0H8I052W6wkI7iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795655552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=l+BrBDucKyUhO3GbRKoc6iODblJyzQZkGIWH+QTSl3U=;
	b=c1XrVX2tkWRlbDJHeVdhbI2O2V2XVqjWO/YKvO7OG0Zj2DJ3RCWcw2shpVkFl+wGjO//
	 ZxBkambJ4jZhxvmNMVq7V1XVZ8NrBEwZb6cYSfZWSeN5h0Z8/ryUlAFjE06/epPLpgqtH
	 bgUKpvvWN29jCq8pY52IINTjPOXPLQWhkOV1D5EXZGYSPdwaDszxtIMxZ9DpX+TT2ykPF
	 GZs4SgaZdORw1HiAwOuGkAna50GuVcfRQZyVuMRyw46HgAE/ICHEKBgs5mzJv73N2ppTI
	 qd1pT7NPzxP6oFTbfPj0Mt7GwSvi5VDQIzUARLnfAg+qZqpUmK8XjTW1NAkUdbsAqZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0bUcEum6;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C52A606A321
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 01:12:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C52A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0bUcEum6
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-36a6ce64b95so2318377eec.1
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 17:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795655551; x=1796260351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l+BrBDucKyUhO3GbRKoc6iODblJyzQZkGIWH+QTSl3U=;
        b=0bUcEum6TpX91hkiHSGg50ndhRxjuDjUtmPpIKSfvsi3SUzKwwmOwch454on/IjdmI
         epdSun1sgfi8SX0NnZ8C/FdfxHDpCDemLsa4ZhEE3cducaib1BpOGIY3o32g9KkNUeqt
         RChS6OGRvE3pO9knubbeqpt6R5LBJw2zqXPma+XEsDOklukjEHYIl+vZ7PFfK2JCXS6T
         629yhNM5UWDhuUSzY2WMN5UZ+i8tb9B7FdWh0UeXC8G+7KJO4t/c7oHLjbkkFAECCr94
         b8+cF5I9uoCqJpFEEKf3jAXZuHISSlDoh6cZ35J6ojm0eWWoYu6d9dychGuspSZuxD+j
         SMZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795655551; x=1796260351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l+BrBDucKyUhO3GbRKoc6iODblJyzQZkGIWH+QTSl3U=;
        b=zJwhoV9wmhsERJK/Wxas4hM9CCjq9V0Jmezsez5+r4li0bVlPsg0aT7d3PBc/w8tyu
         Fh0ZQffjw4xFjTNx1RwrXIS8AYsrI7kO9Ga13asexNdUDmfbL3TDn55Rm+auEcxPOt0u
         Z/hAI/SwOMAPhSlSdbRLXWKa4MMmWiIVAqWrYfw1Drf+Kr0pMmqMHOjv5Uk8kDqNaTOE
         yO+k39j5Lv77yLSlnWXlu4CbFY0YVvQcmULAKE0xJ9zXjKbLSN5OIQXhuWkgXinAYtcw
         I680BhmOWhZ1UBakOhOopqGothxTjFrd/M4iwTqz8fzHHPexnjRXEo5+3USfJGYs2qLf
         Y/pQ==
X-Forwarded-Encrypted: i=1; AL+hErEfrU+biRN9t7S00YtwaRyl6e/PYYBI2kBsgPFBmi7vpmUeBAHyM3yJ6rXSD5M8SxUqE8SjeVvshcQymnjfaHo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mFoAdofDgu3YF5lZZZJsLmH24jjhJyftc+XaOU1INk9nfEwb6
	MnHEsULDvO9jyxje2XgkgDEYUUmX5ooHHeG750NSGRaDlviK8KXs9H6X
X-Gm-Gg: AZFdTZd53XQ/XpO/zsOZbh+mTwYDxXFJN/b/hbXXs0d59XYlBQEzYp4/dy6PuxKuqTI
	L7rZKB1PTMXDVybDoaYjAm0fiYSHnU0Whd8Y+M/qMU9iz8mqgw96ZawiX0HmtCVdIOGvE874Zq6
	WOEzgr8rvgKiasoCU0mhI9b6SYloVfsPkEnHBdDCRGYuhmI9gtr9emgyc0Ca2bXhP5sygKSZW7F
	24E9prpCCX7tLYr7t7PQ5B0M7iNfIResqTBFhljxlDfg9LYSFtsFQoAlY2uSlv2jXu1Ir8jJ2Cu
	nzwPi5IzsSiyp53CU7ZWSV8d5PnzwRQNhIGAZXut3bSf66auo0oPpzzRA1jGsp0RpehzSaqbS+i
	i0Z/v+vB5ep45B4MwqgGzN6IOmSCvkEUhsJEbbOlIW9tL6H0GUKvWLGHbpPGozDc8CKnc6eKHV/
	rYBSJgkvFKcD+nJS8oLKOZLQJJZ3C+AsfaBqKJ/S67+GpbQdzop8L/y6ITvmNcwY2WHj6WziOFj
	jVyHXu4g+vmIr20vduVht3uTapH3gOxzxgfTO2OV6WBRI5JMCSK8LK+o+EmtrQ5ZGIh7Ohlu8Ui
	LfuoAzkYglzk0oAHLXIdJEqD+zV4uzt5i1v3GepbbbkFkHygKmoUPXgydLQOEITxF6mWNGguPJK
	KNDC+p93ynM2licA+H4dfW3F+giV0PLfAzZ2BQjxz
X-Received: by 2002:a05:7301:d81c:b0:386:b7d2:a279 with SMTP id 5a478bee46e88-386b7d2aba6mr9211440eec.34.1795655551477;
        Wed, 25 Nov 2026 17:12:31 -0800 (PST)
Received: from localhost.localdomain ([76.33.234.50])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm55717751eec.15.2026.11.25.17.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 17:12:31 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: andrii@kernel.org,
	bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	alan.maguire@oracle.com,
	shuah@kernel.org,
	alexis.lothore@bootlin.com,
	luisflavieira@gmail.com,
	ameryhung@gmail.com,
	david.laight.linux@gmail.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH bpf-next v4 0/3] Fix unaligned enum values in btf_dump
Date: Thu, 26 Nov 2026 01:12:19 +0000
Message-ID: <20261126011222.92180-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

btf_dump_get_enum_value() reads unaligned enum values through
btf_dump_get_bitfield_value() with a zero bit size, which shifts a
__u64 by 64. Patch 1 copies unaligned enum data into an aligned buffer
instead, as btf_dump_int_data() does. Patch 2 makes the zero check of
enum bitfields read only the bytes of the bitfield, as Alexei suggested
in the v3 review. Patch 3 adds the tests Alexei posted in the v1 review.

Changes in v4:
- Add patch 2 to fix the zero check of enum bitfields (Alexei).

Changes in v3:
- Do the alignment check before the size check (David).

Changes in v2:
- Describe the undefined shift in the commit log.
- Drop the data_end check, which broke the dump of struct fs_context
  without emit_zeroes.
- Add the selftests from the v1 review.

v3: https://lore.kernel.org/bpf/20261116080151.44860-1-dennylin0707@gmail.com/
v2: https://lore.kernel.org/bpf/20261115084923.53182-1-dennylin0707@gmail.com/
v1: https://lore.kernel.org/bpf/20261113223449.97604-1-dennylin0707@gmail.com/

Hungyu Lin (3):
  libbpf: Fix sign extension of unaligned enums in
    btf_dump_get_enum_value()
  libbpf: Fix zero detection of enum bitfields in BTF dumper
  selftests/bpf: Dump unaligned enums and a zeroed fs_context

 tools/lib/bpf/btf_dump.c                      | 23 ++++++++-----------
 .../selftests/bpf/prog_tests/btf_dump.c       | 10 +++++++-
 2 files changed, 19 insertions(+), 14 deletions(-)


base-commit: 3cbbebf6819b42008e7ef85b6f0a7254c3074c19
-- 
2.43.0

