Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7252E42EEA6
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 17:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777571741; cv=none; b=skKCyv0uOqWM4RXLjl9mlTu4q3VKoFdRxJ/BY4HvEVg1tGEEd8yMaamwnm6VJkmkHKCirSW1fVrkjIzuoFC35pxbnlHtvjQejf2UlNlEbtUDMbsFI/xskTeMpWKh5r4Zza87wC3LbDk+hS0UREJkWDG2HGTeQol5ClRMOB7wxj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777571741; c=relaxed/simple;
	bh=1/BYTLuQnuyCXrg5nKytspUZa792KoAurTFKD1q5RTI=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=Uf+DIngJYasBCUg/VG4SR6tFLXSy2QwilxK1JOjVot122Bn7HCTddDHLrrWpLZywqK+BlkzMKCRDByr3TfGsU/2GqqSnZszXJIn66nE8spyDZARh4Q2W1JN6ofCKadtYFXbgrPswfVRcoGZvVXBkqnBAaBrWELqOsW64/lkRvBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xwXb0oTb; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xwXb0oTb"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777571737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1/BYTLuQnuyCXrg5nKytspUZa792KoAurTFKD1q5RTI=;
	b=xwXb0oTbLigxB8Qu2nn8YW3obA4hsBsL2ihzabs0wHOa3RKhSYgGM/vkn/4n0hncMvYHgn
	smtzrEwunS5JvqVXCBoj/ZZkHBGnsElnodtNzMWL1vdHxAkzaXFDcAFYdZVfjAsmJPPQpn
	60cFW5UQk2TmHyuH+EkA4vJ0Jr1UgC4=
Date: Thu, 30 Apr 2026 17:55:35 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Jiayuan Chen" <jiayuan.chen@linux.dev>
Message-ID: <64a92a9ced3da39212885fc00821b5a0aeb719a9@linux.dev>
TLS-Required: No
Subject: Re: [PATCH net 7/7] selftests: bpf: cover tls_sw_sendmsg UAF after
 bpf_exec_tx_verdict split
To: "Jakub Kicinski" <kuba@kernel.org>, davem@davemloft.net
Cc: netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
 andrew+netdev@lunn.ch, horms@kernel.org, bpf@vger.kernel.org,
 john.fastabend@gmail.com, sd@queasysnail.net,
 linux-kselftest@vger.kernel.org, "Jakub Kicinski" <kuba@kernel.org>,
 andrii@kernel.org, eddyz87@gmail.com, ast@kernel.org,
 daniel@iogearbox.net, martin.lau@linux.dev, memxor@gmail.com,
 song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org,
 shuah@kernel.org, isolodrai@meta.com
In-Reply-To: <20260429222944.2139041-8-kuba@kernel.org>
References: <20260429222944.2139041-1-kuba@kernel.org>
 <20260429222944.2139041-8-kuba@kernel.org>
X-Migadu-Flow: FLOW_OUT

2026=E5=B9=B44=E6=9C=8829=E6=97=A5 15:29, "Jakub Kicinski" <kuba@kernel.o=
rg mailto:kuba@kernel.org?to=3D%22Jakub%20Kicinski%22%20%3Ckuba%40kernel.=
org%3E > wrote:


>=20
>=20Add a regression test for the use-after-free in tls_sw_sendmsg_locked=
()
> where the cached msg_pl pointer becomes stale after bpf_exec_tx_verdict=
()
> returns -ENOSPC: tls_push_record() may have called
> tls_split_open_record() which replaces ctx->open_rec and frees the old
> record, but the caller still dereferences msg_pl->cork_bytes.
>=20
>=20Reusing prog_sk_policy with apply_bytes=3D1000 + cork_bytes=3D800, a =
single
> 1500-byte send on a kTLS TX socket in a sockmap drives the split-and-fr=
ee
> path. Without the fix, KASAN reports slab-use-after-free in tls_sw_send=
msg
> and the kernel hangs; with the fix the test completes cleanly.
>=20
>=20Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: andrii@kernel.org
> CC: eddyz87@gmail.com
> CC: ast@kernel.org
> CC: daniel@iogearbox.net
> CC: martin.lau@linux.dev
> CC: memxor@gmail.com
> CC: song@kernel.org
> CC: yonghong.song@linux.dev
> CC: jolsa@kernel.org
> CC: shuah@kernel.org
> CC: john.fastabend@gmail.com
> CC: jiayuan.chen@linux.dev
> CC: isolodrai@meta.com
> CC: bpf@vger.kernel.org
> CC: linux-kselftest@vger.kernel.org
> ---
>=20=20

Reviewed-by:=20Jiayuan Chen <jiayuan.chen@linux.dev>
