Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793942495;
	b=hklMHEWH5H+9TqtCzO+6vedFGTHiweMd+85DC9fTlmJNdIFl7ZmhgRdBszPOfHCJbScr
	 74Bsq5WwFy3QY4hN5ujdtZOf8HNmWdRs7uDfTXBy2+p8xKH70Y5u03pomsYhFKY5n/fju
	 nW10KZkDksSCcaMPnXbiqKeCeM43D9NlORMvMWRRUD+AUQeU8bz6Ave3IN6HBEM3mXUwO
	 oKhGE7KBvrc6PyVcLge6PMuoMD6EK74exv6agvXxJxDqENDFbGAgX91JlM5XCWUWuGeXC
	 C3RAmB/CNSF7BVPc4zDdiO8VczaZewdjNzc4DhE66T4S95psRlqukck9c98gks4yUAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793942495;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=PJRu7W6/Or1we5Gv3BgoLEtby0D0Y0UGgfjBHfRc5+k=;
	b=v+gUyNEVOMSelPiaO7iWukfdfv66qSxsblEuPUZssFtDJv+UiVk76SPn0Bs2u91QETWo
	 2gbrIUSIWf0/uKKIJF70EICUHgR0tJhBubgps9nH7+hgw2ibNpHBP+he0wmUhdQkD4Bjd
	 Bo2KSLd0K7z7cJxOkQck+Sen7P/1sfSJWyeohXupYmg+5ZedPNtrI7cQNqKapm7+M8d0d
	 Bs7fEAqkieCt3Fe7PekmhLg1exTt+Slvuf7kwtTsg4QlJfaAPRFIltGfPJPOlFNqhgHLF
	 kXBd7CsIFcY8KDQ+dP7R1j1L5UC4X1GzMf4PGE4rYFB4/8QiCeunwIQQyuZ7/wBqOQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EsKYeCxq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2685B606A331;
	Fri,  6 Nov 2026 05:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EsKYeCxq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E44CF1F008A2;
	Fri,  6 Nov 2026 05:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793942494;
	bh=PJRu7W6/Or1we5Gv3BgoLEtby0D0Y0UGgfjBHfRc5+k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EsKYeCxqn6TA8KiDCM9rBt12DaeXwg6hOWJoFeiJRa+s/P65b9ChhfO3u1KC5sapF
	 yxyUJKL0C++RPfy2FtZFfxfJrXyhDa1Dujme7ogjACxCx+nqN+REqmmXnUOSXq6VI8
	 +RZmOx8z7mPrshdEudVq8I9H+mM/dx7iJDyl66uU7vKpNkG3P1ZZj16otjvgaixLfi
	 n9TsWekoCY8lUtoku4xB9ZdVLqicHvpmSMSgsADdEgpNagQLLX2aVQuIjbDAQlZbdU
	 GiUmdSt8NNO/N7Z15rOxHz8dcc60bHuduCSbCZXQTn9wbb1nUAWD90xPvtfxTLjVzV
	 Xv4bUdHxqmoXg==
From: netdev-bot+sinfo@kernel.org
To: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Willem de Bruijn <willemb@google.com>, Jann Horn <jannh@google.com>,
 Kirill Tkhai <tkhai@ya.ru>, apais@microsoft.com, rlmenge@gmail.com,
 hargar@linux.microsoft.com, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: 
 Re: [PATCH net 0/4] af_unix: Fix inq_len and scm_stat.nr_fds accounting leaks
Date: Fri, 06 Nov 2026 05:21:33 +0000
Message-ID: <179394249345.488859.17374467033609566688@kernel.org>
In-Reply-To: <20261106051905.218638-1-sidchintamaneni@gmail.com>
References: <20261106051905.218638-1-sidchintamaneni@gmail.com>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
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
