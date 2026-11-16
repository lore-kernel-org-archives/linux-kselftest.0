Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870631;
	b=2dQrI4Aj7RgQ1umIdQ1k4idRQmY5ejBqC8WYMYVNON9gWU7k4e7BXBH3A2uEnUG5FCj+
	 Cs7w4MsZGRJXb3pTLwR8AloBzyeiEsB+u+99OyYbZfEqIonsfhYh3HZkd+NvSK8JhMJtk
	 stl8zxg7PGjGRmyjxLM/Abcu50xJ0W230oeE/0V4wZUkM9yjVCprI2RTM6OzUVzFXCaPj
	 vMakjo+2G6EuFWvZMhCR5S0D6d9QisBCuqNhMLSwhNCavm7SeVxIxM6NfVdB3z1LrmfnF
	 1U1EIhlnUfymJak0vE9H46HqonBARyACSxFgKOCX6LEubTqi/7lzs213wum6j8sjAqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870631;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=K/1LEiaBqfsCo7BjFZtI1spMXwbL70qyG/8JW2RhNKk=;
	b=BHWQ+TC7wqzhulmWAxLYT+SJfJ+gXXp1RsQ887L9jh6vLZ3hZAvL41n+NpyVJRokqSBs
	 bFEqJ6N20UJCPbsPUwnD/ZAF0dYNrc4woDyXtkd3Tejb/HlxpyPptUy+g2XjGQKeEk09G
	 6B7gbNXHOQrc5A+DveFtydgx1Rzkv9z3jbSYTYSpz90arRqn73SdEq053DivWc5EAmJLW
	 jCwIwDMLFEUikvX6ieRNuzivB1ZjRmdBi7BMSOrmMty+bB/oTmjIkm3wWjyQTO/J1Hfag
	 Ar1tsFwqqI2oDdJD/WnZp8nkAwFVes759/iWTJWufqDiRy+aUWYenUL6Kc5u2g/yZYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=irdpkGBm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A45606A323;
	Mon, 16 Nov 2026 23:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=irdpkGBm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 247361F000C4;
	Mon, 16 Nov 2026 23:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794870631;
	bh=K/1LEiaBqfsCo7BjFZtI1spMXwbL70qyG/8JW2RhNKk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=irdpkGBmYu0EPoHZIYXGqtmDu/4H7bDZC5il8ld+5oQ0KFYxzNkuaK5d1pL+TPoIk
	 Np+0V6Rs9YVRS5dSqDUNhgMcSLYKRtSYsE1liMVbskOIYGN2ViNwc0nTaZbUPrBbxK
	 8yljY9QDhylFQ7XSzEw1XGLQIdSH/7IC1bxpPT0vBiix/Dy9Ng2Q5tsjkXzQR7aSEC
	 eskeFMmj0nQ/5M80YzZ2YM3tq0B0DRzBzKhOTfQOCm2YLwltHoVsnseUlif+zK6OIk
	 iNcc3BuZggZgO6XaogaMcP3ChpRsxpFr/AUQXZreyIaHCZ9QQqZ0TQf6+WQBQypbQo
	 JoIMpzL5wh/Zg==
Date: Mon, 16 Nov 2026 15:10:30 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Hemendra M. Naik" <hemendranaik@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 pabeni@redhat.com, horms@kernel.org, jiri@resnulli.us, jhs@mojatatu.com,
 shuah@kernel.org, donald.hunter@gmail.com, ast@fiberby.net,
 toke@redhat.com, liuhangbin@kylinos.cn, j.koeppeler@tu-berlin.de,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 vishy0777@gmail.com, tahiliani@nitk.edu.in
Subject: Re: [PATCH net-next v10 0/4] net/sched: sch_fq_pie: add per-flow
 class statistics
Message-ID: <20261116151030.69ec14ae@kernel.org>
In-Reply-To: <20261109071017.438478-1-hemendranaik@gmail.com>
References: <20261109071017.438478-1-hemendranaik@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  9 Nov 2026 12:40:13 +0530 Hemendra M. Naik wrote:
> FQ-PIE runs an independent PIE controller per flow but exposes no
> per-flow statistics. This series wires up fq_pie_class_ops to expose
> per-flow AQM state (prob, delay, deficit, avg_dq_rate) via
> 'tc -s class show', following a similar pattern as FQ-CoDel.

AI feedback looks at least 50% legit.
