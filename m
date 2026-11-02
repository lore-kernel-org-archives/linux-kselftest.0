Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793648515;
	b=dY4woWsesFoFGEwOkoAPD6yhMNLxzqMfyWO+L4HCnhdlxTVh/BWbQsjMVnRSQ79t7pZL
	 ol9FcJefsweAXeg+0FhVW66nsKIAkjgCiBuwbdYkdgByuLDxlvQyvEmrUakXehfsZAwyf
	 IBfkC4z5laUEJf0HTEZ5xex6YXF5XUkaPc0oAYDXooyAnHoW80hZgfd9OXj5z7WMi/NNH
	 jVA2QixegXgJkz4Dg/QcVR7V69KYk6rC+HFI8amkU4ueCxbz4TVzc2iV3MI2If4bonX7X
	 eTGlpHGsk+0EtucTFhicL7i1kneHpcYDjt6vydyINjRupRZu6qgLUpvKr+TLAPRKuEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648515;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0/kW4wsUT2zMWwDMXId0KVLRkh79sc/p2tB0g0CvyX8=;
	b=lQbDSt7VDDeMEm6lkG51MgVIIo6Pswk+7GEFeFhjY4lVWRj4hAdiOYpEoMVK2drOX3cW
	 4qXBDjP3RGV9TmTp4ea5wkWvK+nwJw2VrMBmaEZB1FDFNyGBVd5KKnBepiv0/Eje/YX+x
	 TuZWBkVw9ZnS2O/Xyy5bcmgaWtJkmhuThDBzXpTivSfoHSLfAvbo31A2hjRN0dXsFTPgh
	 B4lxnE36w6+XaYAPElWpSB9/S9B/yghm4A+nsl/2oN0S4DDtYCeYiTrH1U2RDXTjm23Ei
	 Fw1GVKwK2w+1ftgCDc8gs8WvHKFMvN4hPSZ8aHxugpGm3Oq3OPvZYB8aOGYmZU9JELg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="vXbEA/cV";
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3453C606A331
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 19:41:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3453C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vXbEA/cV
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso34347835e9.3
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 11:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793648512; x=1794253312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0/kW4wsUT2zMWwDMXId0KVLRkh79sc/p2tB0g0CvyX8=;
        b=vXbEA/cVsgpLBA+azcRZA2ASVEOzgTJFnveq6eWQPDhU+O4DlvObQyts7dGL4+k0oE
         re30MZKqEueDei6hgL507XH2Nr/t8nmRrEk9Aea/PnAbhpi2PSB37ty8j+2sakxAi0Ab
         psp/ltjIQk9IIz5ENhhVwYaV6m902wOnmdLa9rKQ9g6sQAFY6CMklvLWeUlSV8D6HPBL
         NZCFZz+ih4sJ+RPt907nVU1SqJ39hJLRQ64q/bY9IbjJogUpurPdYFjt+/jJ1cODBTs7
         JQUsThwY6xDTDljsaj7oKiNSR59jO7AaYwjplL7NQ4QAZUDDXS4W7e+hK3xDAHlyxDRl
         3OHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793648512; x=1794253312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0/kW4wsUT2zMWwDMXId0KVLRkh79sc/p2tB0g0CvyX8=;
        b=GAMUgFTWCCG+A3siUGVle+RfNw8rcl3QmluapaFT9/GW1EHRO8t+ugn0FuNvh3qnht
         petk7wIuNQRcZejABFlMU4qgODgUAYhFVAHGWxW56Y5BUPeN7jIN066WE7w7zRykIc+t
         XV5lF5Ihxqx8uMo8zWC8/V3KWmpbV8An8DH7zmQaD6uDFRKInwprVKSA/tCJShyJ5j5s
         hvAzepmzTFhMeLFyr/1OMQjKiHN2oBloCs5Q8gxoTcHgZYDHanlqAOBFq1EdsnHeoBGv
         cGQ/O9Uz56kXCpPiVp0pqtYBREZ3cN1+41RahweuTD9FMsZu4lIUrwLa/ZO2bDfPesYB
         v/yw==
X-Forwarded-Encrypted: i=1; AKwUvBwYPDRXtaVKGgElywVf7JegcUkPTBouVlsHEyfXERj3Lc2cNcJfre+AENuNFySJGE1jE+pyzpqZ24NoZeSUaXo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXK8lxeO7CllZESfZBASJ0/JsxTHPxhExGB5bFI5RR8dH9y5OA
	H3P1WYTOARBev1giVhJUop9Cb6K0k2WAhZfCyJuJmFFa3xPN3PO3HcZx
X-Gm-Gg: AYBFou1AM/ipIHUAPEYx4vk1iWMa6KywQ7+Rs69MQZJNjZFL4ip8bBH2Vh4fLtFsvZE
	u/VWnh+b53w1z3pQm2fwR6RerXLkmBtvq+pj9vxpHZFRXx5p8QQ1S+E0sgAM8nP4dMfTrusk5Zv
	k/JuGbuS1PBYaV4d8BmCXTZeag/96kCor6h5iipkF5wcQ6/eg6L756NQYeKYHpTMrfIubwASHa/
	xMq1kVYp7UFP9o+FsYhcp4Fhhra+PAXheozahtBIpEz8IN47Ir2wlFVl8vf0cloZtSWjR44ILNb
	+PKYmjA36slqk2NOWye/aB6aba3l83v9omV/rj9Q9l+OQm2QNeMcApsuZmWwatU0YqyyDz6fuGe
	6A6L2EB4Jx/LzikESK21W7SquWwVqn+IKDX8p595OG41rPoQZrkhP+gYjj7D4+Y8/JsDKt/CZvz
	3FN4BGJHDrhNHbCMSFGH7NpKHrNezx6MPk1DPHRfVw2ajtvneHX+1RpoACnXYRaTZsv4TxjMrfR
	wYskrZsvZ8rl0f1/SO8i5E2M+QUqklg5VdtJKW51B9PFBlcq3UFplyfJbZ/GuYzLCSHtnp2Ilxv
	0uKzKnIQ7T+SBXUFzW1jbhqLWZYlPIZGm9ZPgp4iuKSW6U1VaE56bkgD9f3rEN8QZQ4j/5U5h8b
	F
X-Received: by 2002:a05:600c:848c:b0:4a1:d087:f6ab with SMTP id 5b1f17b1804b1-4ac17d19e0amr251986635e9.18.1793648512393;
        Mon, 02 Nov 2026 11:41:52 -0800 (PST)
Received: from mtardy-friendly-lvh-runner.europe-west1-c.c.cilium-dev.internal ([2600:1900:4010:1a8::])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4ac0a0a3495sm231386345e9.4.2026.11.02.11.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:41:52 -0800 (PST)
From: Mahe Tardy <mahe.tardy@gmail.com>
To: bpf@vger.kernel.org
Cc: Quentin Monnet <qmo@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	Mahe Tardy <mahe.tardy@gmail.com>,
	Tianyi Chen <hi@tychen.cc>,
	Gyutae Bae <gyutae.bae@navercorp.com>,
	Hui Su <sh_def@163.com>,
	Josef Bacik <josef@toxicpanda.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf-next v2 0/5] libbpf: Support gen loader attach
Date: Mon,  2 Nov 2026 19:41:39 +0000
Message-ID: <20261102194145.620210-1-mahe.tardy@gmail.com>
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

Hey,

I've been working on this in the context of Shirudo[^1]. The current
limitations we face is that gen_loader cannot attach the program it
loads so we still need a userspace component to be allowed to
BPF_LINK_CREATE and we'd like to gradually remove the allowed operations
done in userspace to solely rely on the signed program.

Note that there's no kernel modification in this series, it adds the
gen_attach options and code generation to libbpf and do the wiring from
bpftool. The kernel side was already allowed thanks to 'b1d18a7574d0
("bpf: Extend sys_bpf commands for bpf_syscall programs.")'.

Also note that I did some analyzis with Sashiko and it's been
complaining because I've followed the approach with the prog fds being
initialized to 0 (and not fixing the two fds to init to -1 sentinel
value), so maybe we should pre-patch this.

Lastly, I don't know much about bpftool so unsure if the way I've added
it is the most appropriate way for the lskel attach option.

v2 updates:
- rebased to includes changes from the 'libbpf: BPF program manual
  loading'[^2] patch series that conflicts with that series.

[^1]: https://lpc.events/event/20/contributions/2437/
[^2]: https://lore.kernel.org/bpf/20261029223348.3730738-1-andrey.grodzovsky@crowdstrike.com/

Mahe Tardy (5):
  libbpf: Count entry programs for bpf_gen__init()
  libbpf: Track generated loader link FDs
  libbpf: Emit BPF_LINK_CREATE calls in generated loaders
  bpftool: Add attach option for light skeleton generation
  selftests/bpf: Test gen loader attach

 .../bpf/bpftool/Documentation/bpftool-gen.rst |  11 +-
 tools/bpf/bpftool/bash-completion/bpftool     |   2 +-
 tools/bpf/bpftool/gen.c                       |  67 +++--
 tools/lib/bpf/bpf_gen_internal.h              |   7 +
 tools/lib/bpf/gen_loader.c                    |  41 +++-
 tools/lib/bpf/libbpf.c                        |  55 ++++-
 tools/lib/bpf/libbpf.h                        |   3 +-
 tools/lib/bpf/skel_internal.h                 |   4 +
 .../bpf/prog_tests/gen_loader_attach.c        | 229 ++++++++++++++++++
 .../selftests/bpf/progs/gen_loader_attach.c   |  48 ++++
 10 files changed, 435 insertions(+), 32 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/gen_loader_attach.c
 create mode 100644 tools/testing/selftests/bpf/progs/gen_loader_attach.c

--
2.43.0

