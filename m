Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7FE39020C;
	Fri, 14 Aug 2026 20:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786739985; cv=none; b=K+5KkTee+Dc8vCNw2IAivkXMlJ3PAgw2ImIOT+EeI4SXomVZUIIUdz5i3c6uy0kCkjBU+FQG3ypLIYZfRr5c3CI7G4w+WX1/cYnzOYoYDwzImqSVcqOEBsUTKtO/zd5uRnmcd6o4pwYPTgsgNoIBnBP01l+C54sZbyWnw5I6CYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786739985; c=relaxed/simple;
	bh=Mwj8XgD43q76hrU9C3eFIlnmyRJjOlGDuyvfQBVmmXA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YeeN0lNt59S84Uvk2IYfUWav/G62du++ki7SfzUx9CG4ptInqFm1O3YYN7P4wH80AXqldUy0q1raSGbA3bSm6r2D0ch7JxhYebQ2I8S3oOUSwSjSBUsQruc3ArknFMjib2RCpuHi/tPxDkcXf9H5lRFoZtmf7wrOaLV1dqi9Hyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DmqBXDFj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DmqBXDFj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F195B1F00A3A;
	Fri, 14 Aug 2026 20:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786739984;
	bh=U7yuZqIIt573/l35daNFlToCqG2WnKSe0d89bnIHovs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=DmqBXDFjFZRNF5t1Y/2PPrgJbxbeJPCdeFL1g5nzdMfpNuQY+eRhsqACUjgB4BA4u
	 bA9u04iybbWCcMkeEQXLkzSUimZEkrc3I8gvKZVOx+GG8nERENVXXP3yFbmrhat7jo
	 3GXPDk45ATX8KOjEaWHCNMLFpd4o8Qv9OjeeGVwhubwnBjjAybon3oSBmdZR71Oyz4
	 puUIQ9KD7gHb8QeY1cWYlEDffVLYQni7PDna9zm9q/zSBxq3ZgDmReUUM1IVqYkLi2
	 a/Jbk5aY3fZV5npKSjg0u3H2dUwJXgSCWkwVFKtk7GOwne5AV63vvZkvckP3svcaLI
	 vz91YJrTsp9Fw==
Date: Fri, 14 Aug 2026 13:39:43 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, Stanislav
 Fomichev <sdf@fomichev.me>, Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v2 1/2] selftests: drv-net: devmem: fix 5-tuple
 flow steering
Message-ID: <20260814133943.45c411d3@kernel.org>
In-Reply-To: <CAHS8izPQn6a_eUgeL5otUESTRud1COHXg2SuR5g9qce1xJogvA@mail.gmail.com>
References: <20260803181852.491437-1-almasrymina@google.com>
	<20260806121631.13175f7e@kernel.org>
	<CAHS8izP=mgsdxv3AtjJo9JY5OHC17zeX-VbPPH_gFF=Ndb_qjw@mail.gmail.com>
	<20260806133435.38c34e31@kernel.org>
	<CAHS8izOU2pxfQH0Wo1DrqajOb54wv3Y1rMryGpwjNnoUsEufew@mail.gmail.com>
	<20260807145444.6acf9c08@kernel.org>
	<CAHS8izPQn6a_eUgeL5otUESTRud1COHXg2SuR5g9qce1xJogvA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 14 Aug 2026 13:24:48 -0700 Mina Almasry wrote:
> > No no, I just meant a trivial test that installs the rule and maybe
> > sends a packet to check via getsockopt(NAPI_ID) that it arrived on
> > the right queue.
> >
> > You can probably extend ntuple.py instead. I was thinking yesterday
> > that it's nice to have all zcrx stuff in one place. But in reality
> > we already have a bunch of scripts testing zcrx so ntuple.py is
> > probably better.  
> 
> Ack, will do. I assume you mean do that in a separate series. I'll
> submit another series that extends ntuple.py with 2 tests, one for
> 3-tuple and one for 5-tuple flow steering.

Same series, please.
