Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794343357;
	b=4fjiTq09NBjMYY/hbbPGzLWBQ7aBPpZgP9Wy9KcApp7tf2AjLLGZib0nj8bziyI1e1Xx
	 TMLrotu8ucIEwfkWCbof/yUeL8OTM/E0/mnrDy0UIIG0JQkJu9YSKjmtnJ2ab5Fu1OK0X
	 IO2KmfHWehp06QDTFaJf5zn7+8kQCMSjfkGCkGIEAnbFGz38NcY2b2BFf0Yb6vRuH1T9A
	 ozTsFUIMsBbBAeDbzzdXrywtQyfQQMdNGNSiOZB4GjbNHbJtzdik0Dqdqy60VeBjKy8we
	 wiP1KlM7+orGSQNCVCqmusbWLHicKfTtj/wIyqjHg608BhW6Orj24dB35RrQxXOZLiw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794343357;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/Uiww4ezFXi6VNr6G5FkaTJlTRK1KjfoprXIwdlqKmQ=;
	b=DuGCQo2PmlEVbZOQmD4dUJWMnnUPZjO5JiOLKZQN5LFc2uH5Wpqe2DYEmXup87HxlIxe
	 OyeGOoP3bQBHRat8ziMhoLcOGdH8q9cH2xZvCJTY3t350x9K0cqcYDYkXa8rM/6ayRoNt
	 WuIAmuz8r2o+KiosG9CHwEIkrDFmeFquol5KY1uk1qB/JozicPo8feXtCvvxoiDss/8aD
	 4HZmHPHuBDhIq2dE56hgb9+BeNXSUyJh2DATifpKAGHmc1Vf0EiGZT8p2Y4QysV3nRJep
	 81oakBc/n+FqtjZ2jdIV0CKSdeN5kwZr8LdPlbvieLlk2KN81bzP1RlVg3e23wtJdcA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PkYKGcSY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8CC606A31C
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 20:42:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F8CC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PkYKGcSY
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b6b22be970so965923b3a.1
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 12:42:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794343356; cv=none;
        d=google.com; s=arc-20260327;
        b=gFOHmLZSme3GzKfMwciKMCHXXBQLyz03XGIdJbaQEQIeanynHHzc2vYjdJrO21kEi4
         6AfTc8CukS84g6+jAvACfF+THTMg5lgRo7Tugauctr0fTOCKMXIfSwbXhr0DClbCyF+Q
         HQnYxHcVU0i4zPvR98KkyEXY4hw5V9v1Pqn4v+AE9RhPRzSv0LYyl6bxm91f8Imr5GUQ
         YtdRHEZkjUNucXANJDDaPxdxqH2qrlp1PkVyHmoYX1ldqz5cWvCIPVFvgQvlkC9EWb1W
         EOlojI8YqvMNDoKfjob17Yma87RoNccNNx7xW7Bm9RD5imst7dWEtNqZIthYjY/m5wvn
         pmcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/Uiww4ezFXi6VNr6G5FkaTJlTRK1KjfoprXIwdlqKmQ=;
        fh=vJAchTiTZYuTlhZWcB1EtIfXfMSBOKtyK0D+Av5cCi8=;
        b=N9TWJv6l79yQSS3ncRM8gUtXSd3yFDhiO09fodTYlNC0rCFS5VoDH8/kdJd25DhYA1
         dV83ygHMSHmTEcxJu8J38d2rTXk6kAT8nzuRuBPCHbCwmPXL0M3ZhejPDLWG8RH5aKCW
         T32HjdLL/zIr+SvgpuvFEeAVs/2grUCn5t4y3rPotSSHUHb42Ru4hSfdZFFMaJA01jkt
         aUMusgYhuiXWAiA6AxxRfx9u6fo0KXhkSn2y8Qsi23cR6nin9r1q+E3KX7qp+Dy0RorY
         Baev3wTUIPyLQjM/z4lgKqVFdF0MIy/KEBeVTOw1c7KD2M67NxWhf15vQWYg4NmOIwJ4
         7sKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794343356; x=1794948156; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/Uiww4ezFXi6VNr6G5FkaTJlTRK1KjfoprXIwdlqKmQ=;
        b=PkYKGcSYMDN/AxLAIZEBQZtApqxXY1YTHtR1/pzU2W0HHe9kuHLmiz9SMfl+9Azmy1
         AKBCGf4AvA7Zj5QGqvzGQRPEQAqVJhXBw7Fb7I99eMXQ6FqoFxKABqWHwmNK2wAYaTIk
         eAhgxsO3elDxymBFgFncDG/08ywScsh4rv7fOmnf0aLVdt8qtsIZTdfxm7UBjFDk/+KQ
         Pp0Ek3x1C1HFtm3IxInYYmXG9UF1iTrkn9WFpNAEjDvPicQ4PJ/gdMlu8HePQCnVr5rS
         BUhdKzjTOqO6E77NWZzyWNPDyY4yVdXVM5Lw0FDlEs4BYjhVWoIHdqQt7al1HzbZVD+M
         /2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794343356; x=1794948156;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Uiww4ezFXi6VNr6G5FkaTJlTRK1KjfoprXIwdlqKmQ=;
        b=Kv5JF+D+03g3hfN6eWn+SK5ciQ69DorUfibppHUOEhwt1fYAVU+I/5z3V6Bhs10Ko0
         e7GnIya9d/FZa+7bbEpH8NK1ibtbVkMJXi+2wU6gmxzl25LUPMfpSuXHIfpelTBpAZyM
         xjB8qsoqiUYY6fd4tIRILuTjUHwkQWgwpIWmfrHFA9CqwYJ15Zs9tsGR1SWwZk6vC8d5
         xdOtio81tDr14CnA4ZvrjM22TSR+Q5GI2ifcKgtJ9KjiacFWHHAk1pAfwpzdXUD0HCrn
         HY0kfNMK/9us4uoURdcIR/W3hqwD+cG9KWYhYw8wGIF0Emtxd3dRt6iYLzfZQSi/V5h3
         MNqA==
X-Forwarded-Encrypted: i=1; AL+hErEa/b717BEtkMnpwQUdcN4VaxICN6IGU12t5UBzTFB0iXXV9K9uzNRn2tWkt6LQRGEDOsEhm0tsA2OLbufIuQI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9UTGMr8sUQD4nFTMmWgJuup273AKVX7pCvcVL2LTkpOgYIw4z
	+gpTZu1VKvC0t9pm2mir8fpygC3fzu4o5rTtresSogIF1ROnKyH1m5znDiGUFvq9Hv6XRE454Zz
	A2Xex5K/SpHSvEw/dpYbIOGLrHohBmC0=
X-Gm-Gg: AYBFou3hRvOEG46TKVU/03TUHFQPMyZw+WoyeejHsQMQLhE7a7ikq6v3IlbGAGgIVek
	DRfRuVj4qCGTcMtIegGJuqid0P9SqdrwICKkpPIq/LKw/ljJViR+jxubZY65uOTu6nL8e0RqHmO
	T62l3teN6gdTBS4uEc87rrKOa7U6oUUbTMTZUG6IGt0DlU/xaaL2YAUvXNekGsNx+dT8VR8NtCs
	LyyWaFLu3dUc1fS5bbLxeu0E2p3tL6Qjq0/U2UnXeSUm0cbTMJ6MJFKa16Fle04lfaOMTX+lC0F
	kkoVtoiER6j5azQvqOVhhYn8sFtELJlNF6GvEW9SQ88v16l4bB4Lyk4/C3akwLW5TlwPtuc8t8M
	rkcRhiNbBDuImdWYqAuwv1SwWgRbeOaXhMy7SXOTFQ7fLUZXRTn747ida9fYvB2u1/VdJULaHU/
	OlfWVph9N4IhJWa9Mfh0rzT8AfCN2mjG9TC+Q=
X-Received: by 2002:a05:6a00:174b:b0:89f:e1e7:e7e8 with SMTP id
 d2e1a72fcca58-8bc1b6ff7e6mr297211b3a.18.1794343355486; Tue, 10 Nov 2026
 12:42:35 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105050225.49292-1-tim.budding@gmail.com>
In-Reply-To: <20261105050225.49292-1-tim.budding@gmail.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 10 Nov 2026 15:42:23 -0500
X-Gm-Features: AclHuK8o0-xxEFoJvGfG6APBQwWLT1OmYN6Yn9riIkt6Sd9kIfeUFXq--mPOaSg
Message-ID: <CADvbK_fcFqT+rFN25sG69piR_HDy6gTnXyL9m=R-m9xumOOh3g@mail.gmail.com>
Subject: Re: [PATCH net v2 0/4] sctp: fix I-FORWARD-TSN handling with user
 message interleaving
To: Tim Budding <tim.budding@gmail.com>
Cc: netdev@vger.kernel.org, linux-sctp@vger.kernel.org, 
	marcelo.leitner@gmail.com, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 12:02=E2=80=AFAM Tim Budding <tim.budding@gmail.com>=
 wrote:
>
> With user message interleaving (RFC 8260), fragments of messages on
> different streams share the TSN space. When a PR-SCTP message is
> abandoned, the receiver still frees queued fragments by the
> I-FORWARD-TSN's New Cumulative TSN, which loses fragments of messages
> still being received on other streams:
>
>   TSN  stream  MID
>     0    0      0    B   64KB reliable message on stream 0
>   ...
>     5    0      0
>     6    1      0    BE  PR-SCTP message on stream 1, lost, abandoned
>     7    0      0
>   ...
>   I-FORWARD-TSN new_cum=3D6 skip=3D[sid=3D1 mid=3D0]
>
> The stream 0 fragments with TSNs 0-5 are freed with the abandoned
> message, are never retransmitted, and stream 0 stays blocked.
>
> Patch 3 frees fragments by the skip entries instead of by TSN, and no
> longer treats an I-FORWARD-TSN that reaches the highest TSN seen as a
> reset. Such an I-FORWARD-TSN is then handled by sctp_intl_skip() alone,
> which has two partial delivery bugs of its own: an unordered partial
> delivery is not aborted when its own message is skipped, and
> PARTIAL_DELIVERY_ABORTED reports the highest skipped MID rather than
> the one being delivered. Patches 1 and 2 fix these first, so the three
> fixes should be backported together and in order. Patch 4 adds a
> selftest.
>
> Patch 3 has a cost, as discussed on v1 [2]: an unordered fragment of an
> abandoned message that first arrives after the last I-FORWARD-TSN
> naming that message is no longer freed by a later, unrelated
> I-FORWARD-TSN. It keeps its rwnd and receive buffer charge until a
> later unordered skip on its stream, a reset, or teardown. Dropping such
> fragments on arrival needs new per-stream state and is left to a
> follow-up [3].
>
> Changes since v1 [1]:
>  - Fold "sctp: don't treat an I-FORWARD-TSN as an association reset"
>    into the purge patch, now patch 3, as Xin suggested [3].
>  - New patch 2, from Sashiko's review of v1 patch 3.
>  - Move the unordered partial delivery fix first.
>  - Selftest: add leading_edge_nopd, reset_pending_srv/cli and
>    pdapi/pdapi_uo; wait for conditions rather than fixed times,
>    including all data being acked before the queue check.
>
> Tested with the new selftest, sctp_vrf.sh and the lksctp-tools
> functional tests, also on a kernel with KASAN, lockdep and kmemleak.
> W=3D1 and sparse show no new warnings.
>
> Initial bug observed in use, root cause identified with AI-assisted code
> inspection. Related bugs found and fixes implemented with AI assistance.
> All reviewed and tested by me.
>
> [1] https://lore.kernel.org/all/20261024120627.837568-1-tim.budding@gmail=
.com/
> [2] https://lore.kernel.org/all/20261026052706.187296-1-tim.budding@gmail=
.com/
> [3] https://lore.kernel.org/all/CADvbK_du=3D-oT19kKBKYSjFKYscnQSH1mekRKMX=
gmLPMXTEH_=3Dw@mail.gmail.com/
>
> Tim Budding (4):
>   sctp: abort unordered partial delivery when its message is skipped
>   sctp: report the partially delivered MID in PARTIAL_DELIVERY_ABORTED
>   sctp: fix I-FORWARD-TSN handling of fragments on other streams
>   selftests: net: add SCTP I-FORWARD-TSN tests with message interleaving
>
>  net/sctp/stream.c                           |   2 +
>  net/sctp/stream_interleave.c                |  38 +-
>  tools/testing/selftests/net/.gitignore      |   1 +
>  tools/testing/selftests/net/Makefile        |   2 +
>  tools/testing/selftests/net/sctp_ifwdtsn.c  | 699 ++++++++++++++++++++
>  tools/testing/selftests/net/sctp_ifwdtsn.sh | 233 +++++++
>  6 files changed, 951 insertions(+), 24 deletions(-)
>  create mode 100644 tools/testing/selftests/net/sctp_ifwdtsn.c
>  create mode 100755 tools/testing/selftests/net/sctp_ifwdtsn.sh
>
>
> base-commit: 6baae996ecf6a3f57b08ea6f6786e29af9260f51
> --
> 2.34.1
>
Series,
Acked-by: Xin Long <lucien.xin@gmail.com>

Thanks for the fixes and test case. You may also want to look into the
pre-existing issue in:

https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261105050225.49292-1-=
tim.budding%40gmail.com
