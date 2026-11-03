Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793701728;
	b=PIT95cLRij+VKg8tXLW/aEgRsJ5OeQoETgAaw7Ne6EOu/BFXX5XV8s1IJ5E1WYS+a872
	 /6xUCtyavjInAGUhhOWVJrlMsqEL50BZWRAzULyD140zL1gtUIn2i5Gzv1vZSxzfyH7dL
	 0DXovd7kvJUaruwF1ZZxomdNgcPd9FDaoelk08yz1107BJnB+AJ9vheVzSTcIOD5ITd9Y
	 lPbHnH/EQ1AhT0kTisTpYRFzn9BSmEjgmqtP9VKxLLI9flvMz4ej12if2Wp4Y226yoQz4
	 WlIAJKBSGAz28u/hvhhIR9IIAG6BVbJm3eBm+BG/CS8tPVDkv0zD8UiF/5fuKQl3Tww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701728;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+slzZtIqAmiMo+gR8iGw7sSnQz1zeHTQz+LiYF2Om1s=;
	b=ZamrdGzLV4aufRxVwg4aB+6nXq5RXEKNibE8ZphAC6K/3kgv+iv3Ixo4XLIvJPS8iZH3
	 WJyxfxiBqkd8D8CrGPeNNELelOOBCSP8cx+mLvDE4YO0A+MXxNtejMPOOHJEAIeo0y9bV
	 dpjhy1XL09x5HFT3PZlttJJWMisfLi4iHtyzZX0A9nLEt1BVg/jzNPiCb6aYrpbL90ZoD
	 BICvpltiYA4EKeTDA0Anyd++yYmEbwxITLF8C0gGSSueT6cwWJhtqYq8SfQmY9QNv08l+
	 zbtViiLF7GHu4inAMVDH21gNBvZyI7XtLdwdNJfagGeQplky42hdsyB/dDK9ED6jsYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jgMfvJwK;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDFD607153A
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 10:28:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CDFD607153A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jgMfvJwK
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e47347279so2480858f8f.1
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 02:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793701726; x=1794306526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+slzZtIqAmiMo+gR8iGw7sSnQz1zeHTQz+LiYF2Om1s=;
        b=jgMfvJwKLdkmgUM6l2TOqZELOJ6ig3ZVEGTUwduPV4c+zsQn3+YESL5L+WYD0Y3KZQ
         eQiEIwJVHJow0yant5InqS7PfE3x9YEHccd5hFvXroYV1qHqS6o2nOj9OjI4xV8/qJwQ
         VqvZq3ntFfzFe0dT7yi/B59rTcSsTW7TWI1ycFsF5NXMozZ9mz68KXijqgSV3ebkKq0f
         brS7Ns/VwL+YyUNg7VB8z/zUaLeQEoZO1Gugkb1JzukwTTKlCPIX8opDvs6RQRylgKSH
         w8cobvXSeeiD90kVslFuGOvLJlcw9gU3OnJ72W2PKGfz5rCiQ8GGXs3lZh7H2SbTJh/8
         7Vfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701726; x=1794306526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+slzZtIqAmiMo+gR8iGw7sSnQz1zeHTQz+LiYF2Om1s=;
        b=VMTxpDu+5za/up1h30/8ztpjhwU+HOxAtvEeDF124Mk4OZh1/uwRzLvbB1ElxsRl1i
         XmOdk/fHJc5LaMZHWY7cFlVLncwVHZUmr4LvamCeylFPCHjXdLcV5fggKEXZskmUzMwZ
         H1KeMMiZUKP608btblBRTzDiATrI6A0jkEID/7/APwTGsaFEMv57uklOmB2SM1OPJE34
         +iahJkdccwMUrGenBbK7oVZZbZDE1JUn67+KddkFfIImvPR3RD/4rlO0VIwFrsDCltzk
         +PqTqoglEHJPGGYo560bpBeaKaw7fQLYP0yZP+dRFOHfJKw0+OO3Z44FElu+oy9QDEIX
         ymAw==
X-Forwarded-Encrypted: i=1; AKwUvByb7dQxgvOHSGyVdgDwPNmnMKZ7OJ0lms8FF49cO+mTaKw/Z4QrumFellxtzgtyxdgg5ZJYNU7zq33MySL+AoQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ccNG2v2fsY3Lk8Gkadvcwtz5P/Q1lGe9HwQQ6zH/0RcQi1tr9
	XKwJtoTAAoVauV0DqBo9mB56U0kKra8lBd/qPVtvZiji0lAXfVQUprxc
X-Gm-Gg: AYBFou3OFNezO4W5f3eZeuIhO3PvtrUCZMma6rH34rVanvj9Dw8FtysTBprdiMdvn0q
	Pkwmc9Y5faiz0B4E2+0fWOcuvXUVt2DyKVnhvWtPIKNtMv7qONMjUdKAut7hIctcUON0wlyeQFF
	WfeTr8mdz4uilpdneXi9lTs6NQB486xPB2186aaoOs+o/jtQvR5D3R9Y664tPnW9iLKIlJXuIAL
	FhXocFm+pc+YksGeLdlGzcKyex2PmuZrEu0V/ORWdH4R5IXrJf+21Y2JyAy+Kvvf8gXUv0Pwd3H
	NrMSgp/R4rZC9xj6eAw5a8s/Lud+0XHEzeWPj6unoBFGlOKMyCp80igWVltWmZOKCINUKuQ0b3P
	hmjroitXUhWx0PdLgAihgOwiNSgOdvA1EMSarZHb3BvMKMIAIcjvuUc7o3yuPIoYlvxbVINMHJg
	wKb3oF/boNimpb1rNNvYUAN2kVu6+jTRy+/oYOIvVI6+zaA8V21dmmwO/EdxLt4Sax5bWjpI5lV
	ofAmDJs275foHlmEx9KFkTSy6egNxPrrXSvusJq4ntWQX+XjXc9gWpG1Ab7Nn4/fwhN6PzZQfcy
	sa0XC4uua2nzuQ==
X-Received: by 2002:a05:6000:e89:b0:487:baa:aa6b with SMTP id ffacd0b85a97d-48e6e4fac5bmr20986010f8f.43.1793701726165;
        Tue, 03 Nov 2026 02:28:46 -0800 (PST)
Received: from nobara ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b7815fsm24941003f8f.22.2026.11.03.02.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:28:45 -0800 (PST)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Peter Xu <peterx@redhat.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Subject: [PATCH v3 0/2] mm/userfaultfd: recheck WP registration in the hugetlb UFFDIO_COPY retry
Date: Tue,  3 Nov 2026 11:28:34 +0100
Message-ID: <20261103102840.68903-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The urgent fixes made hugetlb_fault() tolerate uffd bits left in VMAs
that are no longer registered for them, and asked for follow-ups that
remove the sources [1]. This is one: a hugetlb UFFDIO_COPY_MODE_WP copy
that has to fault in its source page doesn't recheck the WP registration
before retrying, so re-registering the range without WP in that window
leaves a uffd-wp PTE behind.

Patch 1 adds the missing check. Patch 2 adds a uffd-unit-tests case for
it, which fails on hugetlb without patch 1.

The other source 6/10 of [1] mentions, UFFDIO_COPY in MODE_WP racing
with UFFDIO_UNREGISTER [2], is closed by "mm/userfaultfd: write-lock the
VMA before waking waiters when unregistering" [3].

Based on mm-unstable.

Tested on x86_64 in QEMU.

[1] https://lore.kernel.org/20261015-urgent_fixes-v1-0-42796911043b@kernel.org
[2] https://lore.kernel.org/20261015-urgent_fixes-v1-6-42796911043b@kernel.org
[3] https://lore.kernel.org/20261031-fixes_core-v3-23-d6437171ecc3@kernel.org (in linux-next)
[4] https://lore.kernel.org/sashiko-outbox-194303@kernel.org

Changes in v3:
- 2/2: open the source userfaultfd with O_NONBLOCK and check for POLLIN,
  so poll() waits for the fault instead of returning POLLERR at once
  (reported by sashiko [4]), add Mike's Reviewed-by
- rebase on mm-unstable

Changes in v2:
- 1/2: drop the leftover sentence and the non-hugetlb reference from the
  commit message, add Mike's Reviewed-by
- 2/2: "all memory types" in the commit message, rename copy to result
- rebase on mm-unstable

v2: https://lore.kernel.org/20261102081140.201987-1-azpijr@gmail.com
v1: https://lore.kernel.org/20261029221129.89068-1-azpijr@gmail.com

Jose A. Perez de Azpillaga (2):
  mm/userfaultfd: recheck WP registration in the hugetlb UFFDIO_COPY
    retry
  selftests/mm: add a uffd test for re-registering during UFFDIO_COPY

 mm/userfaultfd.c                             |   4 +
 tools/testing/selftests/mm/uffd-unit-tests.c | 105 +++++++++++++++++++
 2 files changed, 109 insertions(+)


base-commit: 0ea6dc8c4a2192227ec25768625686b8fcd5cb09
--
2.56.0

