Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9213612DB;
	Sun, 20 Sep 2026 15:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789916426; cv=none; b=ak8mPBidl+qlqjUnML7zAnz6iWMADnjuT+sjgF6WNXC6O9JAg2J85W3cAXF62xRbe3YnB7DjEj0n0i4XrWZr39RBLz6wKolLvkYtC1dMnTBshJHeGQ8ATqoKO7aQULRd37FJTybiNq/UohJW0pXSCJfgze6qRxqOEVE+XGPMwdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789916426; c=relaxed/simple;
	bh=O9gW5JAOKCx0ljf+WCDAvsV+Hd5qA6zDvEx/ILsAzOM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Uz3jZjeNDS1kY+frd1BiqmusaPb3ryfekWo+DOKVGRVr1l9Awu1u3aCCQUEaSQcvBHbo7Ku1LW1Z9io0O1lFsDed4iTW6BoXv7+HQuuj6ZG5NQojRpQ/g8lkzlEtuK440vngAct5YN5zBBeT2QVbA7LXLNTBVYppA2wyW4LvQTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DRAK5fRn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DRAK5fRn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 746401F000FF;
	Sun, 20 Sep 2026 15:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789916425;
	bh=O9gW5JAOKCx0ljf+WCDAvsV+Hd5qA6zDvEx/ILsAzOM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=DRAK5fRna+GQazAuz1fKOnIk5ddAJj40P7IypCbL1A0a8Q13+hSFhXCdV7+sj+nKZ
	 06uHkiRRsE/Gvy9eMUzZJr+oK/3bSklHxzASwBiFjyOVYlaf3LctAoMqwyjK2Pxu7a
	 qB56ANY307FRV751SyZJ2wfO3LhqWYpdb9laDi/1x1o9NKahFWYwwvwTfvjRLkkSBB
	 /Vu9AtQuGkaZoU6M3xAuzxZeSkUm+IJD8i8fLbTcj8I+sIkOzTVFrYTM7lug53Kpfa
	 nh2jlTTQqdySmcSzEbxK3C6pdfUk1ruHjZvXMZ0BeOVHmdmWLXjsVKBcw2uJo/ssNC
	 pg+s7TwLKEbkQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Alexander Duyck <alexanderduyck@fb.com>, kernel-team@meta.com, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon
 Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>,
 "Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>, Mohsin Bashir
 <mohsin.bashr@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, Bobby
 Eshleman <bobbyeshleman@meta.com>, Dimitri Daskalakis <daskald@meta.com>,
 Weiming Shi <bestswngs@gmail.com>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Jacob Keller <jacob.e.keller@intel.com>,
 Breno Leitao <leitao@debian.org>, Tao Cui <cuitao@kylinos.cn>, Pavel
 Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>
Subject: Re: [PATCH net-next v3 0/5] fbnic: Support larger RX pages
In-Reply-To: <20260919143308.078da03b@kernel.org>
References: <20260915182105.4162425-1-bjorn@kernel.org>
 <20260919143308.078da03b@kernel.org>
Date: Sun, 20 Sep 2026 17:00:21 +0200
Message-ID: <87ld8wq86y.fsf@all.your.base.are.belong.to.us>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Jakub Kicinski <kuba@kernel.org> writes:

> On Tue, 15 Sep 2026 20:20:58 +0200 Bj=C3=B6rn T=C3=B6pel wrote:
>> This series adds support for large io_uring zero-copy RX buffers to
>> fbnic.
>
> Good sir, this series conflicts with some net/main material,
> please circle back after the Thursday merge.

Will do! ...and address Sashiko's concerns.
