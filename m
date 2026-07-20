Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180993C9EF6;
	Mon, 20 Jul 2026 22:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784587598; cv=none; b=Ui+6r+Bgj9hDgDsQ+CKlH2YHBQb3HR/nAui5HBmLEI+QCV+GHZ/kD6DcWFUVHDAkTlMTUPI+GheTDfl0AhFiKHeLInCMlJn4cMkYThWpk8l+EubeyBTOZYK7Eq6M+H/t1CKdCvDIw3pa8e5AFflHBMAOdMZn0za3Be7ImEl3I/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784587598; c=relaxed/simple;
	bh=bgy3JPejVqd0k0EsbmFDn+JJ5QqURb3bPINmBbFdq6U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hP04mjxMar9NRzTmKbiBGjtv6Z7CRvRdbpI+0QIvFyeSyiZb4jOP7G7lZ1Wt7QH3Na50y6OXhUVJrQ+xocqGuiQttUrHgzLa4BhZu5yxwPlm9II2NbVIclHutAlah0De/lTj43R6f0/FdKldl7a+frRIT6fWkDMkukYPDlugb8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HwRjqeXW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HwRjqeXW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43AB11F000E9;
	Mon, 20 Jul 2026 22:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784587596;
	bh=dPbsnAVCyVM0KBQw45+fAExdZalShLIwnygzhqxNteg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=HwRjqeXW2ATdUVgbLKd1uKFb/XADW60HA9IZ0tXrl+RDG9pluVcZBsvRBe9/gjLcy
	 a5ytyjwyzdsy9clIWFNxUBO2IXHlxj0izu/wbwfeT+UpgqpeHtRh8TzMGhK8Lgokgv
	 QPlgpEicX9JpqGRRNDAIxK+PRykyPGJlXUkSREp1jGavmQiXJzkM7DTt0MlHbbgaCV
	 fWFlIeWl+BZHa4iAHOl8STRLSdU0tRgxkXGDsMQD3rvylYEvvAHYAJsQeBhifyY7TD
	 w7ccptJNixNXCTGgXxHvW/p56BnkRkEsKLIxmTKRCaT6GnDEGmoluoel/ppuK0kq72
	 LOMoc48xn42Ng==
Date: Mon, 20 Jul 2026 15:46:35 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Hemendra M. Naik" <hemendranaik@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, horms@kernel.org, jiri@resnulli.us, jhs@mojatatu.com,
 shuah@kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, vishy0777@gmail.com, tahiliani@nitk.edu.in
Subject: Re: [PATCH net-next v3 1/2]     net/sched: sch_fq_pie: add per-flow
 statistics via class ops
Message-ID: <20260720154635.627948f1@kernel.org>
In-Reply-To: <20260630183702.170798-2-hemendranaik@gmail.com>
References: <20260630183702.170798-1-hemendranaik@gmail.com>
	<20260630183702.170798-2-hemendranaik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  1 Jul 2026 00:07:01 +0530 Hemendra M. Naik wrote:
>     FQ-PIE schedules independent PIE controllers per flow but exposes no
>     per-flow AQM state. Without class-level statistics there is no way to
>     observe the per-flow drop probability, queue delay, deficit or
>     dequeue rate from userspace.

Please un-indent the commit msg.
