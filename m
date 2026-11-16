Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794832357;
	b=payL0UFDpE0uUCQLBWchuIAnMoCT4zSLABg8DllaC/1Pp+7492lx2LchiDfwSf/70abp
	 /WXG80tsbPfcpnIk7ZdTOfMTq++JSpTr7i6qSRF4y7nJEw7zsyUPLlkzj+GKFnk8jfEu4
	 PLFavUkE8ZDEAC/BLna5OAso/BkTQbg6VnAVjMtOqv6m5OelJsmgplcpxBtJD5qY1c/XG
	 /DWhzsIxFKNQjO6IzteVKUpP1sAduC31FOeGt19dovfVDSJYonXbnXLuaDt/VsJKj48uq
	 0S6fAtrnPTfbI7dbwEFONlQZU+641qe94eB1WK1eReIsjjhw6xY4h9ygN6pNialSLGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794832357;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8hW3Icu32YpX4MMMfBKofUdXAhk8zTVLp5A3VYY9984=;
	b=XIJZ5W4jsc0TQK4E6xnkdmXQ/gxA7C0FT+sK+DebG3J69n2uUS054XIEH7uqsOkohKUC
	 qBVX7EFaVS7e/XK2BbLH9vDE7fNNdar0DrxOzGfFK642UH68LG4DiuZsjteWY9Q9GftQs
	 Vk1Als0IdD6SS5q1wPznr2GX7qxA56743r/QpWD6Reisy1pQwIHwiOY1jx4331b7VH+XI
	 dL+qD6qCS91kqOF5Wdoqzz5slR0kolnszmCj66CQHy6hmgxQhx+wJrU06t4xo8qplersU
	 hPiUsuiSa2G4qg+HIEDLoyb9VTkI46nfCn4eZLzfSSFQXW5rU4YZxmNVj1bfD6/y7nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M2COT8Q8;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855A1606A31C
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 12:32:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 855A1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M2COT8Q8
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a3c08d6928so4551558c88.0
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 04:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794832355; x=1795437155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8hW3Icu32YpX4MMMfBKofUdXAhk8zTVLp5A3VYY9984=;
        b=M2COT8Q8crFqanvp/JZI70a4Y0PeYmbOCf2PpQwD/jYf0MPLVIVno9HZb2H7gfdJm0
         bGF0ixrSfXRY0bT+PEqwqE1+t9jXTrA6vKoes0p4f6gaR+W7z+BVWqMrWJDeDS/IHLhF
         BUsI50LLTYS3BCoaQN16acZxvVPAYuUkZPj6OWNEJa11ktTm1eqMdcmMxkn4qZFN7VRt
         +9Um+97M9NC0JP73zh33QGVLaqDfRnvCaviNlAU1xip/a6nV3ru5C+2+irKkvMaGOo3w
         Hq1sbH88jWHXnfX8gwMNQ6EtKzEndhC9iQbfqgcJCcc0szKOvlEM1wUw+XZ9PrG/owwn
         gryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794832355; x=1795437155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8hW3Icu32YpX4MMMfBKofUdXAhk8zTVLp5A3VYY9984=;
        b=crJ9LHQfIp5bwuvsdEXDKoMMZJ75SDBWBSrm+Gx0nyD2JNVzA019uKH5kOA8CWtkJu
         QhQET6W07ZrYAEdP7MlV/G70RHBt1X1+zX0bwni21umflXwe10FvaBEezGoROfAF2a3m
         RV5WEgCJe0Bq5F4GUAW0LhOSdTzWoNrbUb7rJbeokgEzjyAt37Npz0P0u6TXYMwLgX+Q
         xXSxiNmV2fiWmTpQCwjdVMtbuT8TRinAFGAWkkNCa25C+/dWVO+CrAI0GwxEEeTgKFZD
         pEEGSjLIhWS68ylYCZu9cUTOqrBGHpgB946ZpefnLnZxFql+kQ1ju56moDAEsgHI6/k7
         4yZg==
X-Forwarded-Encrypted: i=1; AL+hErHVH8JQdlXhLQepv+TG6mptB6yYmq7T3xYcip183Z+VQ4qVT9ggpXZem/JlNDLFL/cBbuQF1lpH2gPHObaojb8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PteHr+soyej6QksEcFqcnXldZuTmoncjYplJMLJ+m64hQYmxE
	Ysmb4wW3B8sxAxavqHQmFOrcjcM1XRel2D9a5tfWX2dwXJrypZb0TWyN
X-Gm-Gg: AYBFou1bavLPMZnihb9arbpJKNPyL2gUN06hFBlXqjL7frv2L0pCsBSY0DAY+fU6XPz
	RnuCsbQT/4J6Vhz9JtY6iODfw3/JemhjqsB35qHzDvmRFVk2ACqI2XCuvxwucrhIwK2YzQ8/itN
	X7KRxzXSY5waD/n9P5bV1pDdEnIiuN2fI1F0I3F/u3TcWA888XdF9YVmJSU2HExbI1XOyjEggFE
	A7AJxf8LpuGzT8Og/di3HoDAEgoAfT8M70SaFu3epM3pNtSENY6+qKxCWCHbBeSsM6hAgn0Zv7k
	d4ncLO5XDLDYHoV6f+W1bjkjhkr5JDdQSkKWq9elC0PEbGFP0uFTH9xPWvphQT7jeaD3pbB3NGm
	YKNE451tDL3JQ4Xg1Cu+bGJJtuTLZdCMtMRjUBTFCFf36/ZZ7NK/yBP2RdRgvQ0LHYWQPHBee9N
	S50wX6Y25YCv/8q4k7MPxvxg2F+xX9Nn4jYVagl4inkcX7mO8caoneQQ0q1wpLm4KvfHWM7RMFv
	AyR/tnDcwtPbvS/wQXhAPtxphL2Tdi/eENCpP83xHkZ/zdr99n3RRUi8MmAC8JvTlmMXSjjH9LU
	i/GnK88+aDKoyd3xI0o4AF3052lKqKdpTW7BwrhkbF7P7Q==
X-Received: by 2002:a05:7022:5f11:b0:159:2c6d:fcc3 with SMTP id a92af1059eb24-1b5030e7803mr8770798c88.33.1794832355331;
        Mon, 16 Nov 2026 04:32:35 -0800 (PST)
Received: from houminxi ([61.170.225.237])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031bc518sm30276611c88.15.2026.11.16.04.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:32:34 -0800 (PST)
From: Minxi Hou <houminxi@gmail.com>
To: Matthieu Baerts <matttbe@kernel.org>
Cc: netdev@vger.kernel.org,
	Aaron Conole <aconole@redhat.com>,
	Eelco Chaudron <echaudro@redhat.com>,
	Ilya Maximets <i.maximets@ovn.org>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v4 0/2] net: openvswitch: fix a feature leak on a failed change
Date: Mon, 16 Nov 2026 07:32:19 -0500
Message-ID: <20261116123219.1781480-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <998d522f-e61d-420f-9834-6bdcbaab1361@kernel.org>
References: <998d522f-e61d-420f-9834-6bdcbaab1361@kernel.org>
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

Hi Matt,

You are right about the hang, and it is mine. I reproduced it here.

To get a failure reason into the CI log I duplicated stdout onto fd 9 in
openvswitch.sh, because info() writes debug.log and a failing run
deletes that file. The suite starts daemons that outlive the script: the
per-vport upcall handlers from add-if -u, and the psample listener. They
inherit the second handle. runner.sh reads the test output from a pipe,
so as long as any process holds the write end, the pipe never reaches
EOF and the run sits there after the last subtest has already passed.

Redirecting the output to a file hides this completely, which is how I
ran it, and why I did not see it.

Writing those messages to stderr fixes it. stderr still reaches the
runner from inside ovs_sbx, and the daemons send both stdout and stderr
to files, so nothing is left holding the pipe.

Checked with the output piped the way runner.sh does it:

  before: "TEST: psample ... [ OK ]", then nothing until the timeout
  after:  21 tests [ OK ], and the run ends by itself
  with a wrong expectation injected: the reason still reaches the log and
  the test fails, so the diagnostics still work

The configs merge here as well. The only message is the CONFIG_IP_SCTP
m->y redefine, which is already in the fragment before this series.

I will send a v5 with this change.

Thanks,
Minxi
