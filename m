Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866D9345CCD;
	Thu, 24 Sep 2026 17:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790271144; cv=none; b=VyU9lrccJ8zRvBk410ipAJUqpXeTdFPmSmaALqv0KNqjY7ziS+t/F0O4xuEC9XRL0ovExfOZvJW6Ld9hLNFwQM06erePOrVVCKBEFTXzxW2Qn14vqF6VsoK0riZcwFDlQdwQWf/Alx4Ut2UgWzAbWv+fzEzJK6lsbDysjEBNgx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790271144; c=relaxed/simple;
	bh=mhU34UP8WNcg3xyasiI5wqQAOf3ceK0sSVdMGOqUhXA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a0FwFeAkJa7OJpmlZ1sZE5shapCtysPVpSfat2DxTfgbLuusEGUlmd+aNZzbMdDcM8pc+qCKwaIj42zw0BzzzYGsWV+TQXxf5HGX2jIko1IJoKaFwgUbfjtE/BqihitXoH/vr0eI1zETwePbn3SoMJCnJMWwHDdbE2mlkj70QGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MsXFKWKv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MsXFKWKv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C109D1F000FF;
	Thu, 24 Sep 2026 17:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790271143;
	bh=mhU34UP8WNcg3xyasiI5wqQAOf3ceK0sSVdMGOqUhXA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=MsXFKWKv8UKUFEWnKRuXNy807qPiThI+312j22+TIkb0ZuJuCF3jAVujCikAD+EHr
	 VOmVZx3jyLO+02DdDP51MgbEd85d+vtSUNZBdU1q6PJAAb7kcnjU1dKbBNbOv8Rzr4
	 xH8m6HTy03kK0ez9Sgv+UJox8xQypovlchQJoKj8L54YIy4EGMgz3y0RmhWICkqlaR
	 ANDWO+76ibdh/MCcpd5908bA3NsPUpI061vzmLjEETN8xqwt28swoEiFlEkopluZsz
	 3wgJIUCqnDh8AcpS43erYMgYV+ssJLNpD8QdkAbQYc56W/Ft62uyFaKEQhnYi5hEUf
	 4u25m2xanyV4A==
Date: Thu, 24 Sep 2026 10:32:22 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jamal Hadi Salim <jhs@mojatatu.com>
Cc: netdev@vger.kernel.org, Jiri Pirko <jiri@resnulli.us>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Shuah Khan
 <shuah@kernel.org>, linux-kselftest@vger.kernel.org, Victor Nogueira
 <victor@mojatatu.com>, hybris <hybris@mojatatu.ai>, sashiko-bot@kernel.org
Subject: Re: [PATCH net 2/2] selftests: tc-testing: add duplicate action
 delete batch test
Message-ID: <20260924103222.239e3d45@kernel.org>
In-Reply-To: <QDISC-K1TH.v1.20260922072206@mojatatu.com.2>
References: <QDISC-K1TH.v1.20260922072206@mojatatu.com.2>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 22 Sep 2026 12:33:59 -0400 Jamal Hadi Salim wrote:
> Subject: [PATCH net 2/2] selftests: tc-testing: add duplicate action delete batch test

ah, here's the 2/2 patch. Patchwork did not figure it out either :(
