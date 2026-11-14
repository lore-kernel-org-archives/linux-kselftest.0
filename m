Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.160.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794672880;
	b=lGTokKy3G2W72dQGE2Uowo+gPnyzLtSyZjRc74+4Q7kOvPBpLd1hscQ510JbXKGELaSL
	 8DV8a23NXqfHF1CvrcDykuM13TYjo4qRNq8k+v1y5cLn4BHZ3712IpwkX/R1iFfOjY68c
	 NKOZhuJlRSUCBXZBZJBE2UgGOwpmxoGcHqJ/L3nogduv7FoDY4Lp47GBaGIudlvUFZM5w
	 MQ9mp1ZCPm3owuBg0IeWria1NuJ26inUkdMooOfKA0UgYodZUaW+nFdVwA5sKD6oXtRcn
	 uzcKVXgRDmp+zXsAw8GQxsf9CnQ8pUgF0Sp3pj42a9FVX5NBXEAb3j+7OVtiW/TPJvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=j8apjl5nKZpbhUKAqnsuXWh8fD6xWu4DQgoUsG2JJJo=;
	b=NDyhRY8R4VSIF5cxX5WwOSm2TCO7rXGKx9BhIUu6sZe1s2IAX4WareMXI4tU0Dmg/Bpz
	 SEFDucIJz7J8TyqfZHBz1XNCDGFIPLyEyAggiN9G+fjxYXx4AB46yrhR3LGA0orHgkYD8
	 c5oZ/4c16Z9T8CyRxpohqW0H/TD9M7zDhccMJA5I7/uL1TvXwxm2M4/g1kwJaaKxouj0H
	 dV+X5Mw7Y+Ua7Wf6TiYa2ncYQFoFhabnPLRqFp4p3jJndgZoFrAtE1XDO7ffvGpbl2t2g
	 3Y94ctmmSV0kBLUJpSPPI0RY0vlXfMjxy1M2q/S2EhpoYidQa95rJI9fCjd1U12No5Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eGnH8kXM;
	arc=fail smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFA9606A884
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 16:14:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EFA9606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eGnH8kXM
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-55c7445cf85so114851cf.1
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 08:14:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794672879; cv=none;
        d=google.com; s=arc-20260327;
        b=GL2lrwg7EjxroAuF5129oYERUKInSnqAx6rOBeSAo0YajvgN2c8/RRnqJBqqFXnCcy
         iodkVFn6srJJWnNNtg0ha/1nVPncex1Iu9H7uUAw36oxI9YmfOMTMzAI/oc+TwDkbpAS
         Ri8mw21TAqxDN1b2RnfH0icbqdQqbYqUQNt46SdGZqRsDiDDsWPuZYg5Role+6wk9fCJ
         hmFdxGYK8IUcWX3WQPZW+nnNYyCqyrDK3IQWFFYtLeMa7U8saYSlaNZPvm8IILoKo592
         sISkzC5lWp+u9zr0CVVe8W+CKxp7dcLIiBtqaw21ZC6Gk1HNDZ4iBTzBqlHKP00/a5K5
         c6OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j8apjl5nKZpbhUKAqnsuXWh8fD6xWu4DQgoUsG2JJJo=;
        fh=UWJUBW4g+vn2d2f0uKPXMvkkvArsfVLPBKcxFPWnyPY=;
        b=KtFh/Gh4q5LQroeUSLaEsiiHXfVJZxvuQO7RlqYgSByVRf0TcdJWArjj+PpNx29VdR
         5ej908xfKzdHTnNQrtDcQwcn0Ao7IOF08oNAzHedDqQ0o1OfGNIHlLuAnNNPUhknuFbL
         ZNcAzOk0y4cP21P5HLCZz45X64AfcwWntprL8vGQQbtf5iKqtlKvBRQjoxLDN7udI6vg
         8hE1oSoIqU+WGT8TxU4PE1C7dkLYdug2hoZpyTU0o5lyVRT3O/QPogpZWpPse+RMWlT+
         a7Ow1d02YkoJpxLZYsf87Hz3dHHQ7ReSeubo7T3Z872CYz1HZb/RgukSCwO2vrBsW5VX
         5i8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794672879; x=1795277679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j8apjl5nKZpbhUKAqnsuXWh8fD6xWu4DQgoUsG2JJJo=;
        b=eGnH8kXMOYxC2TlWp4DVV3gFXtmUqtPsMEjaeD15pze6UXKcTQk0PVcY2uu88INmhy
         cQUr9WEkFjDQ5HeF4AE6m2Tudp7FCIF5CKTgK1EcnR07aNwNxqADbdO9eCaezTJUgtqm
         Fb4i2HWdBNYqQQumVPu+XIKwapyBXUNPo8zxsuaFeKFnAti+agc5Qgv4TJ++gkYDTzKz
         U5M9p6WJkHeu7Pk89bjg8ZGAsXSj1U6XFwKM9chftOZCCjy4IfUmjXrulYXGqWbbKmaM
         TFYH/pKdO/TMo5YxegGwUcggTRsZZTp2dYhIHBSzWafLSFHWPyyvGygDoSxX4Sbwjx+Z
         B/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794672879; x=1795277679;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j8apjl5nKZpbhUKAqnsuXWh8fD6xWu4DQgoUsG2JJJo=;
        b=cQw2v3OvXLlqvdB+QK9cLU3eygjw3G4PHCb7MAlYI3GqTUwnlpU4BLprMEWqWLr6tM
         iA8N3HT6nV86TXm5RkFZ5LD/6pAuX3RSiALdKuoVS32dqPyYR1/FQk3jBJ5J5m65UAra
         D+X29SvmfUH3XGExo8I6Kvu+n04Wust4Xksce3MMWqoq60fjTTVlw81D/zSlCeG8UF0k
         UNzM7ZX4TftZgmU8WSaFQ+N1/9YPSspViZuAleW3+J/A2VTYU08sb9eD/S7vEzQ1K1wE
         njtS80N6bickqSiDp9MULDrc2dOtIAlmgHcmihuyrUAJcyuTOaEx8KrPoXvI+fV+FVa0
         bg7g==
X-Forwarded-Encrypted: i=1; AL+hErFQbve9oM53T9Ru69Ya+0hwS4c3plKINPiX4t4oa+eCjHxFJu4hLSfdy28NouVc+zU4JJIKL1qwcFIeipa2dQ4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TlHRpjXG/4L2r6m3AWGt5GDo6JhunX7W73NBmdtPdiRgsLcQA
	uVpbCFqtXCQ7UJhPsXj69PurGaPtFT2EkrDAFRhSAJkO5JGmueBmUOVZMFUMwP87RiQpYQUONgX
	8rQjrvlPmcy9b0KJEyoK2PU/4ZW/SuVOM+4ccaFBw
X-Gm-Gg: AYBFou1WDI5U1QlVS6MSCeQs7DvtE0KrMmgfVX99ERUqNHn8GO2YESdwEdpfpC/PuZ6
	wBsr9wyU37G/2CweN5qB2qGZTeVuwZlIWngm951m6LddUIsFKhSMacf/3WJflpKftuAWifuL0sm
	5V9xjqaZotC9lZc9yjTq4fYd5uS3SQKHQtpJ6qazoRqwBW7s5uCglsGEil/r/QHuxBLNyD9U2XU
	PWswLLFiXSi7eaD4k+nR4rwiEFVp0r+C1pqPcPMOEMtQ2CF5b+VD7w/IjPsSoJFQOyo47m4gFq8
	7GaetOhqLXL/F1mbR21udWQOfA3p9dleXdTK7ma1FBhKtGPuj39WQUWfj3j5lpGvBKZcTGHxYU9
	Srl0lXTl05bUr9gbiFIuNMq2lylIlpIJjqyxRhdjTH5LQmM2LtnSVYJ3RJAY/FxrG/ECM4NbJ/q
	ieaoGjWZycMzaJH7ncTXZJD94A8YY=
X-Received: by 2002:a05:622a:230f:b0:55b:ab4a:6fad with SMTP id
 d75a77b69052e-55c67104981mr13076961cf.9.1794672878652; Sat, 14 Nov 2026
 08:14:38 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-mtu-probing-series-v4-0-6f2e484ca8ea@gmail.com> <20261111-mtu-probing-series-v4-4-6f2e484ca8ea@gmail.com>
In-Reply-To: <20261111-mtu-probing-series-v4-4-6f2e484ca8ea@gmail.com>
From: Neal Cardwell <ncardwell@google.com>
Date: Sat, 14 Nov 2026 11:14:19 -0500
X-Gm-Features: AclHuK9fNu1No-43bBVfzzgRbtaoksUaeXTfvDONR5zNzzDJjI-OMhnJGTsg3KY
Message-ID: <CADVnQykdN2GhRDNsA6yMoMcj4Yig2gYt=i96zfbVOSmP=qb1jA@mail.gmail.com>
Subject: Re: [PATCH net-next v4 4/4] selftests/net: packetdrill: add TCP MTU
 probing test
To: echoowall@gmail.com
Cc: pabeni@redhat.com, kuba@kernel.org, shuah@kernel.org, edumazet@kernel.org, 
	horms@kernel.org, kuniyu@google.com, davem@davemloft.net, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	netdev@vger.kernel.org, panweiping3@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 11:46=E2=80=AFAM Yongjian Wang via B4 Relay
<devnull+echoowall.gmail.com@kernel.org> wrote:
>
> From: Yongjian Wang <echoowall@gmail.com>
>
> Packetization layer path MTU discovery (net.ipv4.tcp_mtu_probing=3D2) has
> no selftest coverage.
>
> Add a test for an active connection. Check that it starts at
> tcp_base_mss, that it sends the first probe half way between
> tcp_base_mss and the peer's MSS once cwnd allows it, and that an
> acknowledged probe raises the MSS and leads to a larger probe.
>
> The SYN offers timestamps and the scripted SYN-ACK declines them.
> This also checks that MTU probing uses the negotiated header length
> for the initial send MSS.
>
> Signed-off-by: Yongjian Wang <echoowall@gmail.com>
> ---

Reviewed-by: Neal Cardwell <ncardwell@google.com>

Thanks!
neal
