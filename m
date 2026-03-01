Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D863233507A;
	Sun,  1 Mar 2026 16:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772383374; cv=none; b=l4R6mLRgGsdi17vqR27VDZrUk/jdrwfhn+2RDHjuas7fEvcOzditrHAiF5oehGt/GD88fAAFxVKuqVbYamCGmeq/NvhdVnQT+beTvtoTU2PG9cwB2iQnG1YFbRDySpHLnBeNvEvp1WFMPsVW8nhJL/0zB47yNh9mvsw4IL5YwE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772383374; c=relaxed/simple;
	bh=880SwnxrLhukGqrGS1Bj45Q8KRwNJEn0FLoFllxHg5w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PI+c1Ca1yzWuGkke9g58eSP761hQNX24JVKw+WEbb6j8OUcS6lMm0wTEV+VVCCRZuj1euDZAGXDWF75UTjPAMmXgTziOCkfDuqQIh/8MUNyJRh/jXp8iGRpqLB2HQ0v3D+voSxUlNlsy55fg23xxS8bOi4oJ7FG3QzebXX1lMBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf03.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 457AB14021A;
	Sun,  1 Mar 2026 16:42:46 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf03.hostedemail.com (Postfix) with ESMTPA id 3CB386000D;
	Sun,  1 Mar 2026 16:42:44 +0000 (UTC)
Message-ID: <b7d028a084ddda66058504aab72032cb9beaf771.camel@perches.com>
Subject: Re: [PATCH v2] get_maintainer: add KUnit maintainers for KUnit test
 files
From: Joe Perches <joe@perches.com>
To: Matteo Croce <technoboy85@gmail.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, David Gow
 <davidgow@google.com>, 	linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Sun, 01 Mar 2026 08:42:43 -0800
In-Reply-To: <CAFnufp0rQ=p2qGcpDdJB-SjW=qNOaxFRTrO1TprhKLtds96bJg@mail.gmail.com>
References: <20260301011131.4057-1-teknoraver@meta.com>
		 <8eb8c51eeb87f178e92e68bcfffd02701845c48d.camel@perches.com>
	 <CAFnufp0rQ=p2qGcpDdJB-SjW=qNOaxFRTrO1TprhKLtds96bJg@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 3CB386000D
X-Stat-Signature: k1ptbb9pnw59g7nenzt3u6rr5mm1wnzo
X-Rspamd-Server: rspamout03
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+gGSX/yNE9t6Bv9ZlNaA3sWfMgAttT6Wc=
X-HE-Tag: 1772383364-269765
X-HE-Meta: U2FsdGVkX1/wVq20QsIivsFTXAs/Y2/9f35gd4Bf3jEZaoxZ2j9Vb7ixgAPlZYj0Jg2sIOJaK8b+QQzWpTox2dC4yabCJMkq6KWQR4DqQnq4n5oC4rfVswu+ITj0mI3P+LjiTUOfz+AVyx5QoSrK+e9jgpzX18nNDnfzkr02u2gtbu3o6T4WU1rhbi7iCGtP/MtTlAYH0OmfctKvnvRYayWbfDP+bH01h9XjJ6bLACmyc8IXhvHdzpZ7oHbB7HfQvtPbvlpkHQmBXFNmjHWfM0W5bgP5WpjfmB7iVHDV76zgx6d3PnJq73XRxt9nAODR

On Sun, 2026-03-01 at 12:17 +0100, Matteo Croce wrote:
> BTW at this point it would be useful to implement the ** glob operator,
> but maybe it's not worth it.

Hi Matteo.

Given you've now touched get_maintainer, you are welcome to do it.
Maybe change "sub file_match_pattern {".
But I believe this is the first actual use case so I will not.
