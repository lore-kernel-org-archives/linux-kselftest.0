Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E251343885
	for <linux-kselftest@vger.kernel.org>; Mon, 22 Jun 2026 18:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782151589; cv=none; b=l8w/kHAfPkZMfzZ1UdmyG+1qq+CiXexXRz3T3RUdeoFo5VgP365waTy20N0l5EWxy9NftC3bGhWgRFXi6HDl6vbCW4FGoO//8psgJLXem3fWVa45iHlBB7WEhOeRqzB5Motr95yH9CXuaLjhb8Et/1rg5Ua7/6zzaAbahlPxpRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782151589; c=relaxed/simple;
	bh=NC1HQj5HqNHe0KQC0Zhi47NZPqpyD2og3Rovmc2sbCA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TgILeMEbvpfucfXbtaTbERTf3FzIGHlDc3sCjvDhSS5Gg7RvJ4jKC7kZY2u5WJ7qxLmfdi6VT+qAmooyoKmzO8m/xpD+W1gjTvJhwrv3nzjrQSHGi9qoPaMSCNJfapHnQjRNaNhQbbg63mQdtrrDxCxxMf/CEqBFF5L1BZcSJwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SQgCoiaF; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SQgCoiaF"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-139aaba3522so140163c88.0
        for <linux-kselftest@vger.kernel.org>; Mon, 22 Jun 2026 11:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782151587; x=1782756387; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NC1HQj5HqNHe0KQC0Zhi47NZPqpyD2og3Rovmc2sbCA=;
        b=SQgCoiaFKK8K/h2ool0VfAeNsJtvbTUXwKBz66P2IvnhC7QAp56td3FBZdTiv6pECA
         ccUHjYUxDb7KdZc3Dy0di7l4HCYExmjnodZPiaWSMcU7dScX5unz48zQNzWcEvXaz/Id
         dLgdwj6fWM+28XsXslAOumS9FmYmsnKyA/fI1kzAbBEp630/SbS/qJUZB3M6mlO/WV+Z
         CEBExF5mXWKX6U+bDgzbWFdoaBvsjfDrFDEtDNkim+TjrYlCOD1qMGXnxFohZ/OP2cd3
         90ZvXrOZh8WluMRGlSolFLmFAe5fV5PgFnUdvhifubuAKfgpK+qh3tMVwNd0ndv4aJ7s
         mxdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782151587; x=1782756387;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NC1HQj5HqNHe0KQC0Zhi47NZPqpyD2og3Rovmc2sbCA=;
        b=qdFgALJ+OtZUqCCyoGn5eQAU+tCiEjaF6ItRYeR650OlBw0Q8omwg7OQvSWZUOkRi+
         zOZB8zWra6JyOxZXU7l/BtOwKh039G7OyaPKpF25cN99G8fLttpqLhEn3kxq9I2Dktcg
         kZLLeDOY+SdCzoTlWBsCJ0wXNMYWwbUSE9zrtA6xTCW8uN6bqiNWRLoSa6NSsORVzhIK
         +xICWqf6mw0Yjl+H+2ACoauRa3q3ssqYXVjKvNNB19T3wjNQaU0xgXv4QgJgNlXl5BIm
         ER1Q3DZQHE9epFd2zcYth5fyAlo5fxeRJGCGVjjgFitQqw2TkBowqDe4dL+QragBpc59
         xBrA==
X-Forwarded-Encrypted: i=1; AFNElJ+Oquw/4kUq2KGqJTbiBR9p0r1L0NKvhLidzfOiowYmNfo4lFI1Z1kJi4BfkptS+++nt9YXkk1g/yWstPHj5QI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZbh2ShS2KG+QH0FciGRxPmi3sU2OcG6oXBjFWOqr6PeyenLEI
	hBfQRtYW6luQJtiH4JikffdGMOm2Qqu709fjF2prksTqxN7YIBN3kfoG
X-Gm-Gg: AfdE7ckIBexRL7c9q6dzEBaB0iLcdAHvCmmRfaFa/ouIRb6InwMoaB05STW92cglaye
	kxHF3vribE10CmpedF1/OPYVYP9q1ow4whCqIAgT07iiknnuk9TxD+3sqnzGKNBjd/f3/D2gUaA
	wIY8Fl38FwCqNu0Euc9jvfttemfHHn/bvwnQwM+ua0cEMo8C9u8rRBMvJFHWlj2BcMrUxTSWQiC
	5tQgqlh3ZpOh6ZeGERFgashDHwjPtlvIWOnVgdMEX9AdP5UpTn/hRLAwuygg6r3nqBPsURf/g/L
	/MZzqr8hpGk//d61cSCE3VAijO/x4BnBE97fzJabIBz8e/pqNDbgCh7Drknyp0cHqHfFnuWwDLK
	HDUevh2WfhVsDSNp9GFTxbX+NJUfIWmN3jKtfd7NIx2JFs+lkhWgHj/QrSIHjNCPUW4enBo/VOz
	oT1ZIIV+2EchhjVVQ4Sy3bkNwIectA4bdLDMQS/ifCyKQEomf0biD3Ar8pHKG+1zjw9hXjpXe60
	mrmhw==
X-Received: by 2002:a05:7022:6612:b0:123:3c24:b15 with SMTP id a92af1059eb24-139c3cdd5femr285942c88.19.1782151587015;
        Mon, 22 Jun 2026 11:06:27 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:6e2:c699:67c:63fe? ([2620:10d:c090:500::1:5387])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1be4967fsm10411785eec.26.2026.06.22.11.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 11:06:26 -0700 (PDT)
Message-ID: <e6e31bdff25f4905ffe11d6c501014bc50872db7.camel@gmail.com>
Subject: Re: [PATCH bpf-next v2 1/2] bpf: Enforce gotox targets against
 subprog bounds
From: Eduard Zingerman <eddyz87@gmail.com>
To: Nuoqi Gui <gnq25@mails.tsinghua.edu.cn>, bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>,  Andrii Nakryiko <andrii@kernel.org>, Anton
 Protopopov <a.s.protopopov@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 22 Jun 2026 11:06:24 -0700
In-Reply-To: <20260613-f01-02-gotox-bpf-next-v2-send-v2-1-ff980bc5a329@mails.tsinghua.edu.cn>
References: 
	<20260613-f01-02-gotox-bpf-next-v2-send-v2-0-ff980bc5a329@mails.tsinghua.edu.cn>
	 <20260613-f01-02-gotox-bpf-next-v2-send-v2-1-ff980bc5a329@mails.tsinghua.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2026-06-13 at 17:33 +0800, Nuoqi Gui wrote:
> CFG construction records the modeled gotox target set in
> insn_aux_data->jt. It includes INSN_ARRAY maps based on whether the map
> target is in the current subprog. check_indirect_jump() later validates a=
nd
> follows the current PTR_TO_INSN register's actual INSN_ARRAY map. The
> verifier does not check that targets copied from that map stay inside the
> same subprog as the gotox instruction.
>=20
> This lets one gotox instruction observe two different INSN_ARRAY maps. CF=
G
> can select a map whose target is in the current subprog. Another path to
> the same gotox can carry a PTR_TO_INSN value from a map whose target poin=
ts
> at a different subprog. The verifier then accepts a cross-subprog edge th=
at
> CFG construction did not allow for this gotox instruction.
>=20
> On x86, gotox becomes a raw indirect jump in the JIT image. Accepting a
> target outside the gotox subprog can enter another subprog without a
> matching BPF call frame and crash when executed. Validation observed a GP=
F
> in bpf_test_run().
>=20
> Fix this by requiring every target copied from the actual PTR_TO_INSN
> map to stay within the subprog that contains the current gotox instructio=
n.
> Reject the program before pushing verifier states for any cross-subprog
> target.
>=20
> Fixes: 493d9e0d6083 ("bpf, x86: add support for indirect jumps")
> Signed-off-by: Nuoqi Gui <gnq25@mails.tsinghua.edu.cn>
> ---

Acked-by: Eduard Zingerman <eddyz87@gmail.com>

(But please address Anton's comments).

[...]
