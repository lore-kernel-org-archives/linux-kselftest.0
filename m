Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792422604;
	b=SjcGdIUGssyFMvUtwaY13716bgBVqt+QtDwMRvzTYr79WTPztulDqCH5sTBz83Z7EPTX
	 gk6gu0dvEwzvHg+SPW8hbWpSSEANafCgnEdEibC/SMGr0MEYPGzgqrzlvPZSuOu/sMSyU
	 GjLAk5rKgpwPQ+U7SMhmCuhrm4Ql913JbXuTTlpDN/L2HZkjHiO6JyCFYZQaiJdUFPk8n
	 K1qoxLPb6jBs+vZoyyiXmCZial3xBE0+kAcY4xZPLg2fqfCetqUNWeolbcavyKbNWe3Ik
	 wZDVYVD2H0t5zavMEsIXoYIOJUeDvQHaKMVU6wpli+lgSwVw6n0kjyUfNPBgBvnDjWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792422604;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=9BHC+NQh/WD7K9EOsj/r7yz7VJU3Uune/GkCWNdSWMM=;
	b=AD0fGVzo/UyJP3faUop3Uc+Nh49H9oIxpT4Tcn52yBtCUJcVARrNNfVmpDbM9r9lslCV
	 SuWx5uJcDNx0oGBIpgBjza7wGaiJ5d1LDm55APKhQBeVfSS29pd5EfuxeRWLfzumnffup
	 8xV84fr7RAooqlrbKSoEYYotzr/LMEBwCLu9nda5P0XoeiNYC/B9/CLZHJXuBvjCpB1Cs
	 k0mIM7DyPV6hT51fMeZW0kG4qnlUvdDAKbTwqrRHhegayusWFtSKcjBYAp8w80NimnyyJ
	 0T6Y1EovXTRngBoK7UKJtiVbN31QEA63zPyJpBGvVDQonICn/TqF5Hz7YJX3CaMqZTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bU6Q6Guu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E1B6088286;
	Mon, 19 Oct 2026 15:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bU6Q6Guu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87FC61F000C6;
	Mon, 19 Oct 2026 15:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792422603;
	bh=9BHC+NQh/WD7K9EOsj/r7yz7VJU3Uune/GkCWNdSWMM=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=bU6Q6GuutRLD8ykpAN9iHSc2qmou2CFy9R5ywXnmHr+nFTocbp8NKvpcgLCqhIVCt
	 n3jWcRQJ53KMOuJQN5Mx1IUCvgjQRISCB6ne6ZbDgiz8qPrqTPY8Vl/xoPNnh+VX7D
	 oLM/LonJ7hH9ftbzUx7gx1u+4wp08gnWDAzkmrNkTt2qGzl90jzcj4n92kuF014AcY
	 58xNRTdjYuhAwmzTsOA5+kaCB2c6QBEvrOvHfaoz2jRa00+zpJN+ki/eSS+mrJaBWQ
	 ExbdeagDFNaAJHZxRVSoXLdRxA5LAVuNcvAFvZdF9zo737E4+/yPzudKsKZp3nX7mi
	 QGEsZDDGV7srw==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id CFFBAF40066;
	Mon, 19 Oct 2026 11:10:02 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Mon, 19 Oct 2026 11:10:02 -0400
X-ME-Sender: <xms:yjLWamDhRPRFMnT8_94AdXw-umFbtWbv-S8MZh6g73Na9fEeSBFCjw>
    <xme:yjLWarUJ38MEI7mI3UjrD2h1bKzGM3mvHS_DYcBoPN4ECMQx6MiK7ZmO69lWHz9Sa
    ehAw5GkpyNbn3omBPR_7jAiyPym2eoyFDljJYOXhht44Ev3Blav-ayJ>
X-ME-Proxy-Cause: dmFkZTGG+W8+3PLYzPMF+RLo/6NQhLsTu4/fDUAl9cKy30x+SEDL0WXMSeTg2oI647LVN8
    rPZJMexwaPLGEjhbYHKjcMpFmsJQa1+hprk1uYoABvQhwS2WzwLjC2GuCvcSiku9iFq4rh
    /VconsYfDthAIMxyxAWLW/JoxKFutS/ie0B+ZMMDgrBqwP4XXaKJLYWHhHi1gAy0bhvuRR
    MJabqVSA3awvC4bO+mrGJwFaav85hHFMe98SEb4f3Asz/f8iSDsz0iV4K3l+zERCtRE3PR
    5cSx2m5ElqMp83Oh+pBWNf1NBd1NBBRMgfox/wFSGCu0sC3w0kyePzKKQ5zM/vxhqEUbs1
    dtwvqFb9x8D61T85yXpreL62sBlc6nVbV3G0EFl1D3CHoukk3vwGQt7ItwRrs2C4b9bjYH
    B4nh0oOcvj6LTpcu6PouLVz4nWQTx8mmI+IdJYDjjNQQMlYne+pAcEoCIXCmQ2+Tpv6u6/
    uEkPnpYCXYduahlhPsUjA8JJQmWyjHtfhXhNoZtGx8jVrOGqdJ4zwNzzNshi4ev+h0W1fV
    rFHH9jc1Ao8hD+YfsPAwVR0bfzGgyp9bq0oUSho6y6GGOuZtpHvitrWteWD4iVzRdGgXRS
    lXSnSPNYy7JbWhKUtSXcPr31tavjd7uNkBllS/zuayNDSNEgEsOsM2fmzmaA
X-ME-Proxy: <xmx:yjLWam2JJdEWMvBJnmyiz1SyezEgxhzX0w9jIZc9JtVt03Fmg6QslA>
    <xmx:yjLWaly9mQos1ZStfjnaF7Sf24GO1mSeSs-ck9X0NaiJjFkQHmg9nQ>
    <xmx:yjLWaiwrVHYaWBMSseiWptKbe4d7_SvP8tFvffQeNWyVO_1AP-L6yw>
    <xmx:yjLWah_d9ZJnvPIp0zDOWZaiP15hKRpD3AD76I4WXvj5SesM-A-3ZQ>
    <xmx:yjLWas9NZPlcrj8bE6pbyR9Y5FRwsHMJ_y2AMfi6m8va7QyU2BH3HXGX>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id AD4AE782738; Mon, 19 Oct 2026 11:10:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AyRRy8L93003
Date: Mon, 19 Oct 2026 11:09:41 -0400
From: "Chuck Lever" <cel@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, pabeni@redhat.com, horms@kernel.org, davejwatson@fb.com,
 shuah@kernel.org, qingfang.deng@linux.dev, edumazet@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Message-Id: <1f7fe58e-4be7-435b-aef2-177194b4dbb5@slotpi15m67>
In-Reply-To: <179235137532.3135.15441856709185004990@kernel.org>
References: <20261014-tls-follow-on-v5-2-e76c301d4f05@kernel.org>
 <179235137532.3135.15441856709185004990@kernel.org>
Subject: Re: [PATCH net-next v5 02/10] tls: Check for a pending signal after an empty
 record
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026, at 3:22 PM, netdev-bot+sashiko@kernel.org wrote:
> - [Medium] tls_sw_recvmsg() (net/tls/tls_sw.c) still has no bound on a
>   run of zero-length application_data records for any caller that has =
no=E2=80=A6

The series bounds tls_sw_read_sock() because its consumer is never
entered during a run of empty records and so cannot act. A
recvmsg() caller runs in its own context and holds only its own
socket's lock. The cover letter draws that line, and v6 will keep
that behavior. A bound for an in-kernel sock_recvmsg() caller belongs
in that caller.

v6 will also drop the cap that v5 added to tls_sw_splice_read(),
so the two system call paths behave the same way.


--=20
Chuck Lever (Come to NFS bake-a-thon! https://nfsv4bat.org)
