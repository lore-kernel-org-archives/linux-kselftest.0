Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845F83612FB;
	Tue,  7 Apr 2026 15:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775574526; cv=none; b=X7oXG2BavRO2qML4FqcK+/t+PRiSkUGF6fwaiBDttW8jyS2phH1jeRzTkHyiOXHt9QSw++iyN1yQtNT7wAgmvqHGtE1x+cFvHS/ywHXNlvMVxfvMFKEmaDdKGVZ6YdrjBlN8VPYAJTf3dNnYxkH9dMI/hk+P2srdARGeejjIFNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775574526; c=relaxed/simple;
	bh=q/NVy9HGOjeG5K5MygsEupZi81XULJyszHGOqtuQGuY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QsPdPxptIjNCm2+9WqqDiWmNUWKsZtd8BqmXn4bLjOD5ROwpMjqn3+dp5SqaUPRDjcnMuCarC7uoD816iBUaV2mtZKYKm4PO5JUak4oaBMNUUWBazY0bw9KLxKRvsxWeH9BhS9nwr4GrUCeLdl5SFj/y6+92AMEQQLTBDTpL7xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YHVZkKCv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YHVZkKCv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5FDCC116C6;
	Tue,  7 Apr 2026 15:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775574526;
	bh=q/NVy9HGOjeG5K5MygsEupZi81XULJyszHGOqtuQGuY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YHVZkKCvRC7vh6wajHfTyqqLTAnTefH90+KJu0K9kLDxvFj8nLr+MzrRqeTTObRz1
	 M0+9Yogrl0pQ4xFYg0xCGDMv77wQXLp1zAKjfqwRZcaP/iV4P34UXKOBZdwdQxSuH8
	 4rSHva/q60CoPODwPZp1GyMz2xmih3EI5AFgKqlM7MbfC0JwisOIQkWQ8ejiC25WiP
	 uM2z/5Mmx7M5dWFQ24ZkV5N5y0Kr0DR8rXzydZf2mj0uU/Es6yqr9tNrgBfdY94B+p
	 lOcA3oGqC+dyem0d+Ghl9VNoejDFjaGHT6CNq0PBOa8I1P5IBZdylMPZETRAOPKq5F
	 OW436LOZpWF8g==
Date: Tue, 7 Apr 2026 08:08:44 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Xu Du <xudu@redhat.com>
Cc: davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 horms@kernel.org, shuah@kernel.org, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC net-next 2/4] selftests: drv-net: tso: add helpers for
 double tunneling GSO
Message-ID: <20260407080844.35368eaa@kernel.org>
In-Reply-To: <b65f95793e03c1cb3ed3af4e1b2bee89fcf7e648.1775527362.git.xudu@redhat.com>
References: <cover.1775527362.git.xudu@redhat.com>
	<b65f95793e03c1cb3ed3af4e1b2bee89fcf7e648.1775527362.git.xudu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  7 Apr 2026 10:45:09 +0800 Xu Du wrote:
> As the YNL Python module cannot be invoked across different devices or
> environments directly in its current form, the helper abstracts the
> YNL CLI calls to ensure proper configuration of the tunneling device
> features.

Can you explain more? Why can't you use class RtnlFamily?
