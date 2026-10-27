Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793106122;
	b=biDaWUEt0vPH63y1C9/vsBotsWyXPmjdvNC1jgLQVw86ULGBDqo9sZ6ID+DGw6z7b7Qt
	 pEecq1uqQy438qt5UMrV1Y20lfK39z0HCP45NU0hdvk2fjbc8craf9QfBxkaL9y7rFmMZ
	 kt9RuMgYecFgivtK96Yi73+7S6TvklHaVQgyKCwbtqIPou2h+Ab42OIZE9Z5iboR6kX8e
	 KyVd+RGCC8CsCC4sIOVYB2hzpmSmwxJao1D4+FbGSEpyqpx/Fe9gdJuUpYcEzrCHaMz/9
	 yqUVlGRiNwy9fGsY2Fc9T77ox5BOfe82TVxMlW3+I//pIwbbXIrjAzUWJqDHywvf8Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793106122;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=i9G2JCIv/JRmW0kQ4TGfObM2TEv6afLzmEbFfR5oV6Q=;
	b=czlJZR4P691a2vfgHrYUTkrrbLzlHuCoolt+u+DVxt+qKnEHTE3XbYluAbQWUIiSoodA
	 bqEc13u4qelyPxkCnSnkQ2xjf2TYHlRNT00xFeTg8mCmns+bedIq0R1TQLN14TEP01ViY
	 +5Esem/Ai5/p+QL5/Z/3JBLv5XaSz0HoY+MGTDuPR68AFukSfKlQcUszsmHQq5b+7OQ0U
	 Str7w19PNkqKofvLk8vrwWRIxRCDZzFmvLR1EN3ri0ThvqfqzPrnnDAUHT0L4zw792x0x
	 lLyG2rz/xFI7QK5npIxjWq+t8NroM+5q3iBiCPNlqprVkwb/j8x9BO1XBh6UDQIPj7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LfiJL7Kp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C66606A31B
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 13:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LfiJL7Kp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D85731F01829;
	Tue, 27 Oct 2026 13:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793106117;
	bh=i9G2JCIv/JRmW0kQ4TGfObM2TEv6afLzmEbFfR5oV6Q=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=LfiJL7Kp0zGuKPKa1HkxBdTP/+WegoU7cmRw8MAC9klelGfHV8Wnxpcjqfn9mmu+Y
	 YH71AAHiNlk5EdegPfv61+UJE0E25iZj3y5NjhLK0k9guUNezY/rVCc41p8U6SVqIg
	 kOyiySMmrII1mxtRpNkWwFLiTFr1LDwT5EVIztSuHZcpCxjGvGvh8VjCDtyJCrjN+G
	 HHRlZhCR1iX2jnuiwmHjuVeoijMAWs9grEqLC70Su+seMOkYC/J5pAp7jstTdO/xfB
	 iGhpGeYUdS7m8wr9p9jXv/IEolNYIzQvh391QGQ1J6+uM19FpgRkqW9EXgabFBWkf3
	 bGMQihrED0FBw==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 30629F4006A;
	Tue, 27 Oct 2026 09:01:56 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Tue, 27 Oct 2026 09:01:56 -0400
X-ME-Sender: <xms:xKDgarZKiqf39F5EW2Pj3229L9XP2SSsxZURvUVYNILBu7X4HJt39g>
    <xme:xKDgalMnWCTygu0nzv3F9JEbXF37erOaBkGf-8go7BFoUPVMmUhXiM8jEz_5xT7nb
    Fe1f3jbTH4A6uyNQ7iMWhlyyE-oY4JbCj8FqShs4aQgfhupzA_l3uMG>
X-ME-Proxy-Cause: dmFkZTFOU1y/OvKrSgcBPQXB3dGTEzPY65VfwI2jHkcwvBEJ7fusGIrsTDPIiT3U2qIKO6
    1BU5iLekNYC+Lw+CXK4idgeJYmaDaMT11Oeryr9fmpb9/gyqlkGKYShNKo9wH57EKPgTPg
    6MdG0A032ddgvmlRU6KD+vqj93RYQUhpkq6BZcVXklu85y7a7O25YlVIBZ+NIKW5ENCf8Z
    cicaBDIxq4KhAthXRzgWcqNTPNfcwuTqOf7Vjin9c8Zooj6npV1MqHbtgZZQG2TqWRe++t
    9zBYx61VoDDNcMql/nivbpcUmjPpXZVqDm3lxMnXyEclczbYfPaiBxEKMLg83EPt72Hak5
    stLyjAtaOiy8Fox+semeihPu0FGK6gQIFIxdPG/QGk25w3KkcTlupJqZbpFga/7i4LCwsK
    76vcqCmxO0G3a9fgd0CCfkMZCLkBuoB6G3ad4k7lv1hl0uHYOT7xWQi/WfhUVo7QmGela9
    PPnW5u+Ku3vLUjUBXQ5cDc1S0GyE51OBItbw8MKzsQQwsDc1OBs/LU6mKPLE4scEGex/E9
    OB0XPeMIZ1FstyP1VjpHlhc41C/LKBV10CTeCy06GB2cYAPBflMEycFPFkGv9o4QMaxnlh
    hoOMFUf4caQbSGQgL8Ib49EFf9YnCZbI5vTIfQCNXRZ5aCY6zAgz8Cl2wVbw
X-ME-Proxy: <xmx:xKDgatxP4t9EEheDx9sDAdonn9qJUzXn9PQPNdMfgWArOXB6exzYtA>
    <xmx:xKDgas3nCay6FataEp3SaOw6lz03VhPzlQQy-mhUDPFp4q_AJmsOyA>
    <xmx:xKDgarpz8X9j7TSZuc-nlMyR79uuJRAM_DT9ynCz9pC6BljfADlfsA>
    <xmx:xKDgaiDiH6TQgKGNB4Hb1gBQHMlmkATqQvIZ-gZjHOm3yP2cnDqkEA>
    <xmx:xKDgasqY9_6r6OAXjeAAkX08AykczdD6x2wYzyxOVpXIsVL7a-7V44Hn>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 09958782738; Tue, 27 Oct 2026 09:01:56 -0400 (EDT)
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
X-ThreadId: AjA0I-APw1sV
Date: Tue, 27 Oct 2026 09:01:35 -0400
From: "Chuck Lever" <cel@kernel.org>
To: "Jakub Kicinski" <kuba@kernel.org>
Cc: "John Fastabend" <john.fastabend@gmail.com>,
 "Sabrina Dubroca" <sd@queasysnail.net>,
 "David S. Miller" <davem@davemloft.net>, "Paolo Abeni" <pabeni@redhat.com>,
 "Simon Horman" <horms@kernel.org>, "Dave Watson" <davejwatson@fb.com>,
 "Shuah Khan" <shuah@kernel.org>, "Qingfang Deng" <qingfang.deng@linux.dev>,
 "Eric Dumazet" <edumazet@kernel.org>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, sashiko-bot <sashiko-bot@kernel.org>,
 sashiko-bot <netdev-bot+sashiko@kernel.org>
Message-Id: <01a7e46d-033c-4a39-ae32-0b7bdde47ca6@app.fastmail.com>
In-Reply-To: <20261026153748.29911bae@kernel.org>
References: <20261019-tls-follow-on-v6-0-ab01c4ecca0c@kernel.org>
 <20261026153748.29911bae@kernel.org>
Subject: Re: [PATCH net-next v6 0/9] net/tls: Receive-path fixes for zero-length data
 records
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Mon, Oct 26, 2026, at 6:37 PM, Jakub Kicinski wrote:
> On Mon, 19 Oct 2026 12:55:16 -0400 Chuck Lever wrote:
>> Commit 3be28e2c9cd0 ("net/tls: Consume empty data records in
>> tls_sw_read_sock()") fixed one reader. TLS 1.2 and TLS 1.3 both
>> permit a zero-length application_data record as a traffic-analysis
>> countermeasure (RFC 5246, Section 6.2.1; RFC 8446, Section 5.1), so
>> a peer that pads its stream emits them by design. The other two
>> software readers still mishandle them. splice(2) reports an empty
>> record as EOF, and the caller tears down a connection that is still
>> live. recvmsg(2) makes no progress on one, so a peer that streams
>> them holds the caller in the kernel past SIGKILL. With MSG_PEEK or
>> async decryption, each record is also queued on rx_list, which
>> grows without bound.
>
> The shape of this series is still quite confusing to me.
> Let me take over a little bit so that we make some progress
> (while retaining your authorship where possible).

Fair enough, thanks! The first 2 patches look fine to me.
I'm not sure whether I need to add an Ack -- they already
carry my SoB.


-- 
Chuck Lever (Come to NFS bake-a-thon! https://nfsv4bat.org)
