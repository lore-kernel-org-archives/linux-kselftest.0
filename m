Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CBC3AAF54
	for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 23:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786403913; cv=none; b=aFkpZlgk0BsDavnBViO4cdECNdFylOdyfBPHk/JzpTz2DXOxgSVscVAKYKLQXIEJpjaVSQCo/N5FXEq43OcpDo+XE3QIR5o7tJNk4Al+uG/U9eokq/Sa4Bg462fCGzfcKByp/clf3WtsoqDbs4xOuZlhmCma+OYNmVDw1zfYz8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786403913; c=relaxed/simple;
	bh=lQOFcQpS75/8Jqf+KkFR95eQ4Cjthj5L4QAlXBcqNuE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fScCZ4ApZ5e2Q3w6dZOsgtM4tekrff6OcwgcQITSOPTUd0Z19NHaSBaRFJaXQSdgJfHgEOQ8WYt8vcbAYmSwY8CNtRfnlk0GdZEhA7PQINaKEWrltuKY7rcb/BxbSDx/xDBsp1rl2iHyA7LPY2vYE3Q08odQNj+yk6gxe588d78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qFPml5uX; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qFPml5uX"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47c2ae992beso178337f8f.2
        for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 16:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786403910; x=1787008710; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L0G1LhQH45+FBFyTubKs6iZM/Vc1A1blzDgpoJPDaQk=;
        b=qFPml5uX6xecsK2L/pKY222JDmXSETUp86Sz5lKKjF8aDCEIR3eLR/2UdJWUUPNEre
         xCwbC3rozeWnzhTnqEPTM4+wngMGBNnf4Ml0MjsRjD8vJQXSO7raQU2S7DBE4dvwdnG0
         Nfj3jt5hbAo/IvNgpZwp65P+elay2s0n0wSXzyqUd4EamsiUkSmhjVIio48TECu5GjsZ
         Uks8vhIzA4k10wabLxPWZKjnjJXWAsUlwwZCL3mKPoF2klA2Oxt7iK65wObl9eZ+4Idj
         /i3LP/g32gcsbziqIRr5HyopjVt3MRFJj6zywPEdf82a9e8I8yqBe/iNJ2o5wA9mHA0z
         Rr6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786403910; x=1787008710;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L0G1LhQH45+FBFyTubKs6iZM/Vc1A1blzDgpoJPDaQk=;
        b=LwsYjF95ii2KZKFKEhVn9ZdSj8f6LlMF4flucV7vmFxNQO5pPJpkovFldR253w9j3B
         8+HbBzcD+SuYLnH1ZlOQr/m3YX2m+MxpJbFjb2/KOHtAm0FVTh8UBHj831y6CIhxRjqh
         wJ79IArHNbIO1IjcuKNZ6bcc9aCs+61ZZZPg+bouInT7By3Ngg0L01tHW04clIT0OTuM
         daUNEUwsiOsr/V57omZyYk24IilkZoXsnj9OORZsNXWx21Y5mUFcDsNaF1wlw85MVkk/
         cmbbPD9PQnryEo80UH5CwSccb3rzruf0pnM4s/sOPJEUd24GwyGcnUhA5OefYAeItP/e
         kBcg==
X-Forwarded-Encrypted: i=1; AHgh+RpDjxIGhqOZhy3qUBBxoRFVFeKd3NrOZtdY4ys+TwPMf8e9mYd9wGgivzkJkSDJ5fQaMXY6mhb+cXDv5SIcmHk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEwqbXSn5zVyv+34e7P5k/woh+YXuZIYV0abDygGNsSj86mIC4
	UCPxUSkMRpLvgmwQxA9um+ia6JWYVRaskUP/hmH4DvA4adv1iylKwoj4
X-Gm-Gg: AR+sD10sfL7XZy9UMnAwOGMlyPi5HENDjXU5WrmSobTE3rOy9WHxlBKB2BDxr/F8RPl
	y9kmM8RxsghaZ9IlypwaE6/LFPW72Igt3i8WqUuiRChMHLPupwBMyf9dbPaTMXbiKQRt+ePjtqu
	Cb4iLm2FR7ez2LoZImp+Qsd4sGtMyUkPNbUdPgZBG8foS6GjRiMXB0ep0C/S+0GtzV4HeqDYfSx
	XWDQDa0PdsQmFuSW61rpKw+JUIqZg8m+fO5qc2HLOa2OzTB9hnooaLRWzH7U9tiLF7FzOk4fl4X
	QcYXdwmaZqpZsIoLl+FiFiCcGyPPZnFVuUlsN6rrLEOe9YiaAftpd90RX+JInD5L/BPQzZg5meN
	kPdvRT8QRWzN40jtFwr5lsWVtC+yHTRczDQLM1fVhlTXLDBNG4pF6n2zSs33a2gtVijgRT7+j53
	8A+0s9XTDCPdTTb7z+zCl4Rsg2SMuM0A8nmlKMU4y3ht7mV64SQlxDi7yYo0BRGT3i/+3UQxEH4
	1snK1Yq95pUoGZFDzKWhyTIARBjl24TkbfKBt5LuLma7uzcexzLJzV20EZrgJStcZcpWsJmppCj
	HhnVnGonhYTD
X-Received: by 2002:a5d:5f83:0:b0:47f:80e0:53bf with SMTP id ffacd0b85a97d-47fec5322c9mr33773964f8f.3.1786403910273;
        Mon, 10 Aug 2026 16:18:30 -0700 (PDT)
Received: from [192.168.2.69] (dynamic-077-187-035-246.77.187.pool.telefonica.de. [77.187.35.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021f8f33sm44251330f8f.27.2026.08.10.16.18.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 16:18:29 -0700 (PDT)
Message-ID: <8ee040eb-29c2-4bad-88eb-0817d2270a15@gmail.com>
Date: Tue, 11 Aug 2026 01:18:27 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 3/3] selftests: net: hsr: add shared-mutation
 regression test
To: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com
Cc: edumazet@google.com, horms@kernel.org, shuah@kernel.org, lukma@denx.de,
 m-karicheri2@ti.com, fmaurer@redhat.com, luka.gejak@linux.dev,
 bigeasy@linutronix.de, ali@iusegentoo.com, qingfang.deng@linux.dev,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20260808004525.1551-1-xiexinet@gmail.com>
 <20260808004525.1551-4-xiexinet@gmail.com>
Content-Language: en-GB
From: Xin Xie <xiexinet@gmail.com>
Autocrypt: addr=xiexinet@gmail.com; keydata=
 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
 sNySbH3veZ/55EtlXA==
In-Reply-To: <20260808004525.1551-4-xiexinet@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dispositions for the AI-review findings on this patch (the review is
published on the web only, not mailed to the list):

> The header calls this subtest "F2 (path/LAN ID)" and the changelog
> says "Add regression coverage for both shared-data corruptions",
> but is any path ID actually checked anywhere in the script?
>
> This link is created with proto 1, so only the PRP path is
> exercised, and the checks below only decode the PRP RCT LAN-ID
> nibble.  That covers prp_create_tagged_frame()'s frame->skb_prp
> branch.
>
> The sibling branches in hsr_create_tagged_frame() are not touched
> by either subtest: [...]
>
> Would it be worth adding an HSR-tagged (proto 0, version 1) case
> with captures on the slave peers so those branches are covered too?

The analysis is correct: only the PRP RCT branch is exercised.  Note
the F1 link is HSR_V0, which assigns the same path ID to both slaves,
so a path-ID check would indeed need a version-1 link as suggested;
the NETIF_F_HW_HSR_TAG_INS branches additionally need offload
hardware that a veth topology does not provide.

> Every other capability this script needs is probed and turned into
> a skip: ip/tc/python3 via require(), sch_netem via the tc qdisc
> probe, and HSR/PRP plus HSR RedBox via the ip link add probes.
> AF_PACKET is the exception.
>
> tools/testing/selftests/net/hsr/config lists only: [...]
>
> and CONFIG_PACKET in net/packet/Kconfig is a plain tristate with no
> default y.  On a kernel built from this fragment,
> socket(AF_PACKET, ...) raises OSError(EAFNOSUPPORT), python3 exits
> 1, run_f2() returns 1 and the merge reports a hard FAIL rather than
> a skip.
>
> Should CONFIG_PACKET be added to the hsr config fragment?

Correct.  In practice a kselftest-merge picks up CONFIG_PACKET=y
from other net selftests' fragments, so this only bites on a kernel
built from the hsr fragment alone.

> The capture loop above also exits when the four second deadline
> expires, leaving i_src as None.  Since None != RB is true, does
> that make a missed vIp capture report as "interlink did not carry
> the RedBox MAC"?
>
> The m_src check that follows is the assertion this subtest exists
> for [...] and it is skipped because the i_src check already called
> sys.exit(1).  [...]
>
> Could F1 get an equivalent explicit check for m_src is None / i_src
> is None before the value comparisons, so a timeout is
> distinguishable from a wrong MAC?

Yes, the subtest still fails in that case, but the printed reason is
misleading and the primary assertion never runs; an explicit None
check would separate the two outcomes.

> The changelog says the results are merged "so packet-socket
> pressure or a skip cannot hide a failure".  Does the merge hold for
> statuses that are not one of the kselftest constants?
>
> Both run_f2() and run_f1() end with nsx python3 /dev/stdin, so ret
> is the raw exit status of ip netns exec python3.  A signal-killed
> interpreter gives 128+N (137 for a SIGKILL/OOM, 139 for SIGSEGV),
> and an ip netns exec failure gives 255.
>
> ksft_status_merge() only ranks four values: [...]
>
> With ret=137, ${weights[137]} expands to the empty string, which
> bash evaluates as 0 inside [[ ]], so 0 -ge 0 succeeds and the
> function echoes a, i.e. 0.  rc stays 0, the branch above prints
> "[ OK ]" and exit "$rc" returns 0 for a subtest that was killed
> mid-run.  [...]
>
> Would normalising ret to $ksft_fail for anything outside
> 0/$ksft_xfail/$ksft_skip/$ksft_fail before merging address this?

Yes, normalising ret to the ksft constants before merging addresses
it.  This only affects abnormal exits; normal outcomes always return
the ksft codes, which merge correctly.

All four are test-code remarks; none changes the verdict direction on
the configurations the test runs (it fails on the unfixed kernel and
passes with the series), so no respin is planned for them.

-- 
Xin
