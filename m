Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6CC3BD654;
	Tue, 10 Mar 2026 03:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773114642; cv=none; b=pmG/sQanYd9hnuiqY0SkUe77REk33Ce2tRWA8IDJu8gFrzKEUnqFNoXjhjwR68yfx3lfhehny/Kg08aq/YZYLwWlIH4Em2IzcCoHkDc48sFvF+AuN3u7JSU4A3LSyT8QTvA1Bc7sXwFB+tXCFI7P09hH+5QKs0N5rrOZBdR9cgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773114642; c=relaxed/simple;
	bh=XA9p4Ff/wwPWLbP3NNjaY1tk+461W4b+QtBsrgNh+eg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=h9vNkIOA6hhx6dC/zdNCJp5kbsugvKailw83dEtysJlp3OaklwlF/aGFAdVX24UuN0Bb0iIN19nO1N+3zYH8lqaGT3h/5EKKjJKh6fwGcgCa+NS1+36jSO/xlSiD7nMHm2GMy3wykVvh/lq4IbUUN6DNrTcNCLSKEv3MCfjF6vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf15.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id 3C1951A043F;
	Tue, 10 Mar 2026 03:50:39 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf15.hostedemail.com (Postfix) with ESMTPA id 78DA21D;
	Tue, 10 Mar 2026 03:50:36 +0000 (UTC)
Message-ID: <45f1347b4738e1ac77d6847000d6c609da94fd46.camel@perches.com>
Subject: Re: [PATCH v2 2/4] selftests: riscv: Add braces around EXPECT_EQ()
From: Joe Perches <joe@perches.com>
To: thecharlesjenkins@gmail.com, Shuah Khan <shuah@kernel.org>, Paul
 Walmsley	 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sergey
 Matyukevich	 <geomatsi@gmail.com>, Andy Chiu <andybnac@gmail.com>, Deepak
 Gupta	 <debug@rivosinc.com>, Kees Cook <kees@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 09 Mar 2026 20:50:35 -0700
In-Reply-To: <20260309-fix_selftests-v2-2-9d5a553a531e@gmail.com>
References: <20260309-fix_selftests-v2-0-9d5a553a531e@gmail.com>
	 <20260309-fix_selftests-v2-2-9d5a553a531e@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Stat-Signature: u193rprgjo7r93buudfppys8kyybw38e
X-Rspamd-Server: rspamout08
X-Rspamd-Queue-Id: 78DA21D
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+KGfyI8RkAuQVljT1LKgxF1j0M9vsA+Ww=
X-HE-Tag: 1773114636-622055
X-HE-Meta: U2FsdGVkX1+l88962NQxhoMCTggFAT4zW9tz2CSvpJfh8DtT37gahn5IelQZmitPhxpfAzl4lOOE7eoTuyIYx9necZg+hy+/LKJEQG9utTt1yi0MsabMAXDslf6+g/hZ44jjgyb6ks9J0JBRR4T7sVrjxpNouhoXkfqhA3v/wtfRX4sTyZOU7uzhOdfBrQczfJSvoKS2MgniYLF2Wrs2vjevNYA7DdJQfkymxpuKjtywIWTXbVDQahZp7Zk+NtFKW/LvTrdaIFY0HDqYCDpuL9RJkPfHrdHyJoEa5k30kNQZM5GXt0IC5VY7GcCZOOjIVg7yqypXjdNh6Mw+CARknZ7cK1ue4cUq7sBajnL03xfoLShetRzNyg==

(adding Kees Cook as he originally submitted this __EXPECT macro)

On Mon, 2026-03-09 at 18:52 -0700, Charlie Jenkins via B4 Relay wrote:
> From: Charlie Jenkins <[thecharlesjenkins@gmail.com](mailto:thecharlesjen=
kins@gmail.com)>
>=20
> EXPECT_EQ() expands to multiple lines, breaking up one-line if
> statements. This issue was not present in the patch on the mailing list
> but was instead introduced by the maintainer when attempting to fix up
> checkpatch warnings. Add braces around EXPECT_EQ() to avoid the error
> even though checkpatch suggests them to be removed:

The __EXPECT macro definition is a multistatement
	"do { ... } while (0); OPTIONAL_HANDLER(_assert)

Perhaps the multistatement __EXPECT should have another
do {} while (0) around both statments like:

	do {
		do { ... } while (0);
		OPTIONAL_HANDLER(_assert);
	} while (0)

so if else blocks without braces would work.

Perhaps the same for the __EXPECT_STR macro definition.
