Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE6527F005;
	Tue, 17 Mar 2026 14:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773757659; cv=none; b=HBOs8C0h7GNQxYWHi7g0/AAqj8jReubCvEdADWCYURPphCffkqXeVm0MH5+1TkrKQOw7dHh04sL/8gr299Q1XOWOz+teJyEPNSkNBO420cMI0/zx4NnCScPncsY5DIrjqhoQX7zq8W9LCZzDIVQCVfl7/pPJkcvJwzmxscqxCGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773757659; c=relaxed/simple;
	bh=XOl6Bu+EEA4KkABLbtRPgOFSYl2RSYASfhO2RLLNbis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UzMghogn+OVIqNgmcrF9MWV7AKCAM1wdvj/FjiWjpvkH9u0lRL6vYXBGnjRP+JUf74YDOVL+bzt6wTcANKbEjUurRihueNDk54O3/L79ZAgESZ3BJTnCerbRoAB1bK2R0ze2Kfksq+bxRJYNkr4LkPbh7MTWw6FKR/jepGh/w3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=REgn+xp9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="REgn+xp9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D8E1C4CEF7;
	Tue, 17 Mar 2026 14:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773757659;
	bh=XOl6Bu+EEA4KkABLbtRPgOFSYl2RSYASfhO2RLLNbis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=REgn+xp93sGdMEzMbVACcol4tJ5zgJfBrmh+dm04pZUFiu1Wy/uJm5ZAWUQD5/D1V
	 1vJ9Lys57KR8+WLv9QJpJoE0MmxsitHxDJ0Uh5qJjQ91nhhCfhz2f0i4bYf26ofcwp
	 zhjN+skWVRONSWhw+VUfvM+OOLEWh9zyGrdINjeCbik8zqJPusZ7KcDVeMfzJWqplq
	 Ysgy2K0YZg4619juY6eFGB3Z6TW6ArKoou0Y6DQVw5PQE3kSbLxicmy5nrH6vGK6/n
	 9t8g7rhX5+ctRXQNxRoGYDSIGYPCczcBJc7HuqcE18WUwvE006ivNC+emY2OC8JSLV
	 pOncUB/cD3uvA==
Date: Tue, 17 Mar 2026 15:27:32 +0100
From: Christian Brauner <brauner@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, 
	Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Jan Kara <jack@suse.cz>, Oleg Nesterov <oleg@redhat.com>, 
	Aleksa Sarai <cyphar@cyphar.com>, Andrei Vagin <avagin@google.com>, Kirill Tkhai <tkhai@ya.ru>, 
	Alexander Mikhalitsyn <alexander@mihalicyn.com>, Adrian Reber <areber@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 0/4] pid_namespace: make init creation more flexible
Message-ID: <20260317-rohkost-gehorchen-75eeda82a4a5@brauner>
References: <20260313111014.2068913-1-ptikhomirov@virtuozzo.com>
 <20260314153203.cfae7d3f420d2da050870f4d@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260314153203.cfae7d3f420d2da050870f4d@linux-foundation.org>

On Sat, Mar 14, 2026 at 03:32:03PM -0700, Andrew Morton wrote:
> On Fri, 13 Mar 2026 12:09:38 +0100 Pavel Tikhomirov <ptikhomirov@virtuozzo.com> wrote:
> 
> > To: Andrew Morton <akpm@linux-foundation.org>
> > Cc: Christian Brauner <brauner@kernel.org>,
> 
> Actually Christian is much more pid_namespacey than am I.
> 
> Christian, a MAINTAINERS record would be helpful?

Yeah, sure. I can add one.
