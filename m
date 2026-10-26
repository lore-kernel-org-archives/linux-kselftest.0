Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792992474;
	b=T2IrBABLnxPlrsV/+HwL5jGBfVOeeygOWKux9QOFueqKxwIqrK2Y7I/ZJqfsWn6l4NY5
	 7802PO3kx1keeOfyLai5kruG8WpfbQVgg+IMpJnEboeSXpdfgEQSRzrZHm5Lab1JI+GbK
	 V+nNi3Q3v14CRa5Omnm6iMbMl28g/elZfrFSnCH2ctLrxwBITZ3faoKTc2oRf9eYjTnup
	 O7TiuPNtjh8yUXk+rj7JzJ8eRWAMayGOFK9/OtJYfqWv12jyJJZomriw1D/9ndem01iCd
	 QWVd5zuoYITEjUZO5EFMz4h78BOxdJK2om/OMvwFmx1SvzMPpSN2ouu+aJfBS2Uij3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792992474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=c2vVLfr5r23oMNsvxAvIsVWSucEEuXtAs0YtxOnot1U=;
	b=do4ZkH5fzoMD9lgjPP9ElwL2JouV3r7ftgFtvYdxfZcXDggioyFSQ/I6br8uHDCi3YpC
	 yhqx7hfi6tTo0Z+dYQL2+xd8kWq8LOrWDcsRlH3hYvAKWCWXS8qwojm3LgEJ1uk38X8f9
	 orzCVzznFgDxUHmTGJ2wM7jfmJBLQNnne5tIsu1qqOXtiPBNplhXkr7a1fgvFr7rr+g/I
	 I1u1o16+66qAl0eNljUcx/TKP5PExRM7I3PWMmAlDK7YktXyZIuUD1IpvzGC94T/1u721
	 upvui4fe1rUsj0I7AwRZIXDAyZwaRF2pC7CSrilW10QhDJni4qngLg/F0VO4PskLETA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="jMP/3eHG";
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366E4606A32E
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 05:27:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 366E4606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jMP/3eHG
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-156cbe59524so1704315c88.1
        for <linux-kselftest@vger.kernel.org>; Sun, 25 Oct 2026 22:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792992473; x=1793597273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c2vVLfr5r23oMNsvxAvIsVWSucEEuXtAs0YtxOnot1U=;
        b=jMP/3eHG+EcjoJUjkHbgDNSNscVw1lpaVMGVmlUpSZzj8OH+U3b1U1M2BhE2Mv8I9+
         vqrrRNa5OA9HhlhBVpqgpBpk+jw8d9HwWsf/blISembtKeT6gaD0G3HT7EacBY1BhFNA
         QazbKzpgew+ACfErhewIOJ3thbxuc2XrD5GfdKyk8zl6bM+EIWPMksj6qQ3oBrXZOzwC
         mpWCSIUiPObAEG/CqyHrzXy7Fa4E05tF/kJHXvIHnKYcNxDDGyyKgG36WcNdxV5hs+0E
         rXurmLsgyIVpwv09sjXTYPzp89m0LKWKukArbhcO9O1hgvfCJNbxYu4tl3umhJy8fGfi
         dynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792992473; x=1793597273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c2vVLfr5r23oMNsvxAvIsVWSucEEuXtAs0YtxOnot1U=;
        b=Ghgk1coQvl4RxuK16nFUhhoi+kHjzGmkuziYvlR2IS3KwMopBnzChCNLMfrRPFY3tg
         cvuDY9lGCjaSKtVFhA5tmaSdU/uAb296AyQvkDdYXbAvtGX1HO5yAtqy+fNmkC4tZyDW
         +oryXTlR6fj/ijDzK8fs10dGHS0eWPq0fwfzCJ9NfjMlFXO4NrS4r3tKymS1KswUzXAc
         TjKoRtuKhhnbjfn7n0M+kTPJ40IPZHrDfcf7jinjclhYDR7jLroiXBY58BfKD8/gih+t
         EFT2pSBWMoXTLX/Js8cFuLfrAU21ibCDrghPVLc4zZJno1+9lVeFEyBHal92AYyMxhyq
         HjhQ==
X-Forwarded-Encrypted: i=1; AKwUvBxB9fkeMNR0Gx0gRzYZ8He4mAe3NG5EUHRSkiW6j9n0LJlvYWQmM5+cW+0/JbkEdZs05d1SdJzJysWyHb4OAK8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTvPDki2J8HD8CNGVOApcscRSeUqSRnEeMrGQbUu7TVemZqLW0
	v4zKBJT3UKMSxczgKmy8q5juUVeRNUD4kVRQgqYzjdqCi0/pvvcWXrM8
X-Gm-Gg: AYBFou1VGvNgYlL95FkEg0vANTtqQ1NusgAPSYyXaycEQCh3I+p0cSxnWBk00sWfYc7
	IoXgn9nKhlnI9imD07piH+71OiqmRSlOTznYxWwneXk81MD3LTSy9l9ZFek6s5kK1JGzybEToPN
	Z0GqgfEOAS0iML+lad2FH/39UGKa0ocRyQq0KuBI/NMV6LZP2+PPkvmVw3BPE/GaWrJmqkn/V6P
	3YO7WiSnvhlMpWahaJYAYCeuBE9G7yBAu456d7Lm/ZRa8E8zp3bbqyeBFVVW07/mBQdfQOZXHYA
	uBKxCynr8Vge6rL6pFmwpsk0rRMUojBKkOsWk8+D1Lgnz/cb75ZPnX7R4pL7rUMEk8xwHbuG+SC
	8GQ5zcqMS5eoW9s54dQnOjzxTv0iEtpGMmUmmzszklH/HnMTOb325gEBKCvna2A3tnYLV4v1kN8
	SELfjxOx1nO4QhAq/3NtRnL9tfuG1Zl6Xajzwfi5NaKFXJgQa/JY5TcT4XPrdEqruusk7QEPCk+
	4mRH7n0/IXBoctbTNBJtsRRvX8GTnxdnrU1DYtox/HNs4KFja0gnQkVHw/i8n+wfwlFAyrC1Z/W
	dWUALQ9Bbsy3Pqjubv5Syh8NDA==
X-Received: by 2002:a05:7022:b04b:10b0:164:4e36:f956 with SMTP id a92af1059eb24-19935905c52mr8981726c88.16.1792992473149;
        Sun, 25 Oct 2026 22:27:53 -0700 (PDT)
Received: from localhost.localdomain ([136.25.42.214])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0e8d700sm25064523c88.10.2026.10.25.22.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 22:27:52 -0700 (PDT)
From: Tim Budding <tim.budding@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org,
	linux-sctp@vger.kernel.org,
	lucien.xin@gmail.com,
	marcelo.leitner@gmail.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH net 4/4] selftests: net: add SCTP I-FORWARD-TSN tests with message interleaving
Date: Sun, 25 Oct 2026 22:27:48 -0700
Message-Id: <20261026052748.187496-1-tim.budding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <179293012994.3134.15218902499880345860@kernel.org>
References: <20261024120627.837568-5-tim.budding@gmail.com> <179293012994.3134.15218902499880345860@kernel.org>
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

On Sun, 25 Oct 2026 12:08:49 +0000, netdev-bot+sashiko@kernel.org wrote:
> [Severity: Low]
> This isn't a bug, but the deadline check and the poll() timeout use two
> separate now_ms() samples. If end - now_ms() comes out negative, poll()
> blocks with no timeout.

Agreed, I'll fix it in v2.

> [Severity: Low]
> Does the reset case check that queued I-DATA is discarded on reset?

[...]

> The test does show that MIDs restart at 0, because the marker is
> delivered. Could the test leave stale fragments, or a message in partial
> delivery, pending on the server when the reset is issued?

Agreed. As it stands, the reset test only shows that the reset
completes and that MIDs start again from 0. A reset is only performed
when the data sender has nothing outstanding, so in v2 the pending data
will come from two PR-SCTP messages that the client abandons while nft
drops the I-FORWARD-TSN: one partly received on stream 0 and one in
partial delivery on stream 1. The reset is requested once by the server
and once by the client, so that both new abort_pd() calls are covered.
The test then checks for SCTP_PARTIAL_DELIVERY_ABORTED on stream 1,
that RX_QUEUE is 0, and that a new fragmented message on stream 0,
which reuses MID 0, is delivered intact.

> [Severity: Medium]
> Can the RX_QUEUE check fail on a correct kernel in the ordered and
> unordered tests?

[...]

> Should this poll assoc_rx_queue() until it reaches 0, with a timeout?
> Or wait for some sign on the server that the I-FORWARD-TSN was
> processed?

Yes, confirmed. Lowering net.core.wmem_default alone wasn't enough:
there were no failures in 140 runs between 212992 and 66000. small is
then sent after all of big, but Nagle holds the marker back until small
is abandoned, and it then goes out in the same packet as the
I-FORWARD-TSN, behind it. With SCTP_NODELAY on the client and
wmem_default=70000, the ordered and unordered tests fail 10 times out
of 10 with "2464 bytes left queued on the association": the marker
goes out right after small, and the I-FORWARD-TSN follows one RTO
(300 ms) later.

Rather than poll RX_QUEUE, v2 will have the client wait (with a
timeout) until all of its data has been acked, i.e. until SCTP_STATUS
sstat_unackdata is 0, and then check RX_QUEUE once. The server's
cumulative TSN can only move past the abandoned TSN once it has
processed the I-FORWARD-TSN, so the check no longer depends on timing.
