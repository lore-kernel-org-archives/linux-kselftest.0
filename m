Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC5349E5FF;
	Thu, 15 Oct 2026 07:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792050222; cv=none; b=o8h/AmYaABVGtQBxgTAEUzRCW+iERCShE8vwBDYwEzrG0hdrlcIKb+sau2+3NigL+5fQ+lcuNTiLskyBMX9EnirWeuV/YBtWik6OO/bDYj5Vpc+4iK4r6J1j5YDRi+8iDBL++qWi0DBmZdP8Sv8mcC/TCRv+Mpl8O5QiFRKMsyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792050222; c=relaxed/simple;
	bh=x8GQ9TqAFu5driuvo38kqzYt3n324pebOlaNmEELI+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q9mh1fYkN/uE9cdFw7YfUDV+KzG7deScYt8xsqa60gvAovAm6wTvUgck/RHAKUY/bLsOUBmYHXu5c98Sh4nTBYp+NQhLWkCC8uF3r4HzcgVdc/Gxd/r7I7wf/h+6E+Rot1+yFw7xmBY4FoqP62EVmpmS5OcfhyLtiIO89JeLVr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=avxfbTMA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="avxfbTMA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7BD61F000C4;
	Thu, 15 Oct 2026 07:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792050219;
	bh=PJRu7W6/Or1we5Gv3BgoLEtby0D0Y0UGgfjBHfRc5+k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=avxfbTMANEBfzVLsIqD7E/Dd14H2HWAqfQi/N1vosEjCv0S/PveXsz5hsLUSNa6D8
	 NzZUlZjDeYBAz/mZyBmTjF4nr3xrGeyPIcb+HgD8eDnvrSWLaWERdaBa/J0RxbQfsM
	 S4J2hns8JpbaQmo3Wo3987UdC18YtCsbO5g5/z5gPwP1Va3yaqj3MmRgY1bI9oxt87
	 Pc2n+8lujnrKYCSb2u201lQbONNahe8dsQxdGR8NNSdXkHyUnyvXE/SHdvOw5V3VNa
	 Yt0vlTp1A/IGOnMrq0TITgqJbSgIn8PhuE4ncqJWp9jI+vAEpxJAjj//tICwL3Nkch
	 MpqyX1ybZS82w==
From: netdev-bot+sinfo@kernel.org
To: Octavian Purdila <tavip@google.com>
Cc: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>,
 Kuniyuki Iwashima <kuniyu@google.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Willem de Bruijn <willemb@google.com>,
 Soheil Hassas Yeganeh <soheil@google.com>, Wei Wang <weiwan@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 0/2] tcp: clamp return value of tcp_wmem_schedule() to
 non-negative
Date: Thu, 15 Oct 2026 07:43:38 +0000
Message-ID: <179205021846.408196.14808616314279740107@kernel.org>
In-Reply-To: <20261015073736.2944215-1-tavip@google.com>
References: <20261015073736.2944215-1-tavip@google.com>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - How the issue was discovered, e.g. hit in production, hit during
   development, syzbot report, manual code inspection, LLM or static
   analysis tool scan.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account. If the series needs another revision for
other reasons, please include the information in the commit messages
then.

The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
