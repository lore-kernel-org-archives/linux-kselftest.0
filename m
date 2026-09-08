Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA723F1AD9
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 21:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788901348; cv=none; b=dysY/Tc1jwvt70l+GAvM3EYdap5SEUNG114XWmNgY8390dIJgYgy4omvjjE402sUU06EkjAQUohwX8r9Z/mWpry6GTKolBl5cRIp7UF/rSwFjz/fatrVf46LvTRr/enyKCEVx/eivzFNO9Bh2rRHTmhsrjCIiFUObsHv/1B0+k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788901348; c=relaxed/simple;
	bh=bd9xi0N3rfkqry0x1YqyaoxKZnsAKbGywNtxLyc98es=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gtPri+/kN2VuhoGih14J/EK79hbGQW+V6Pw6HEBTOZpNteaR/L4BD66GqJ1Tbda0yY5LzxCTAr9n2RfDY+CZj/cZaPa3Q6NxSyi0KGD54uuuenpZGY21F82n0TORtdStnStXbODbDhreYad78j7oLjDrlnoWjFoQkTSRrGaz9hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xof46FWG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xof46FWG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B90361F00A3D;
	Tue,  8 Sep 2026 21:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788901343;
	bh=sUj2tGJ84SLrIUDajcfhUjeh5g/d0LaSfpAMYFutJ7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xof46FWG3Yj34OLy5T+pvgV0ROpy+5Zy7AH3G8+opaQP7X047foW/BiWjhYDtIwI7
	 MBDWBbVZ/RRhCEyzKGYHoiRRvjQTeIEP7ctAJ/TBCwoIcOOOXrTaAutANOQ+jGg4T0
	 YMCFO2yLACSQ/uy/SZfbeAcjurdNf/HbqWBP1e+NMy+vofZZ2ZcjMIXYdOY9oHaFgT
	 WoOAFqLOO5+NcUeS9Oem93RPuFkGLv0LWu9vlGuI5G3f0z1FzsuVyIlOhpLsrBls+w
	 aLJPtx9w3ajYGvc8aSn4deYQMkqEM8vCsck4XUA0Y6OG6sOBSF5BxmjoSeosY7KRe2
	 gW4sKHvbbASaw==
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfauth.ams.internal (Postfix) with ESMTP id F0114198003A;
	Tue,  8 Sep 2026 17:02:15 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Tue, 08 Sep 2026 17:02:20 -0400
X-ME-Sender: <xms:13egaiv3I5NU7VkxDzDwWakKBx8vLWSGAgFoGO2JwU1lWM-KeeqChA>
    <xme:13egaoLrTAGAf8PKDwojN6-fnAt2cd4EKu1ADshk71glMBbS5cFtGKptEky8Wf1mK
    DcE4DRcHGIKZ0-s35gl6A84yMKZ_cBAZlaKukZDnr17HgrXngKHGiyT>
X-ME-Received: <xmr:13egao15JrCthvAwd8a67FoiaL1RBjeWvS1WTY6pLhSSX7ZYGuMumx-nnCk>
X-ME-Proxy-Cause: dmFkZTEAILA6vc5JwE1AywUZhHj3jrCZoHnZLeOWd69ORmx0fD70m1rj/vEtHXnDNbZ/3S
    JbZrhvU5i2gCAEseWg8ahCUqEo46O8afIzjj0LeuDxoGzqZkV4cyrGYUvzgqoZJBMTbuN3
    jWKEzH/ZQxzy4VmBoZ/TyPXkyEjAB/tHZ0tKcccELp4/GxOE707NkBOG3g7PkbB1CzqEvp
    0KtWO2dtBG8BGkW68TQrYp3sdyh7ETyZWTuT1ajiI1J4Dru/d8hD6yTvO4U44jWIhYkACx
    rvPqpCBmfzl7xqOEdFrgQJTocBrtcyT7b7+4p5MkFHwVAlUgpoFxlnvSuXq+EVi/E6wyA4
    jILJ2dkKz6ujRedUs17ko3DHmINS6jdEsRiP9kfTzh/RpKaTP7B5ZkQbqFKOd7D/vNQLbA
    bK89aIgAq5FvDxLP48Lr78jJrP6NuZsN1fI4VZw2iDkD4ZnhKlbOkr7Afi5PePALdNioVI
    LhnrDLQw8dZE2Idm2XTLoFEvPVu2uts0bwZvGqaSs/d+59+2ZmV3BM/ozt0gX0AzUHmmk5
    v8xJQ8yq8yZghiLCvaLLa8E/MLHjrrHicKDlNCB/+dK59W2PDOeVCdVjazxT+ELm90imLW
    SMgwKeJSPEkDdeizukYNUVo7WsuiX1HboFGYpxHaZAh8j6q4jV17QrpNE83g
X-ME-Proxy: <xmx:13egatNAY0gyHF6R4MNJ2-Ya2RdYgFjVX7fJm3Fcf1lra-j6koLYgw>
    <xmx:13egal61Vs39srGUNYlctXsK5TryErbfKl0XKBwTa_8pRfE2UQGiOg>
    <xmx:13egal-4yhKJnXzCc2CFEPcDpLvaijicsF3Bg-Gacyubo9BYdlPyFg>
    <xmx:13egaqj-pW7Huvu53CmtDnjJDCbTP068Poqs9cr4bS8Axsg-oopNlQ>
    <xmx:13egahmeoFhUN6TXVAB1XzkQVfQz7gqe46pSSN2oPS23zCImg4QRCcmX>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Sep 2026 17:02:14 -0400 (EDT)
Date: Tue, 8 Sep 2026 22:02:13 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	rppt@kernel.org
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, usama.anjum@arm.com, usama.arif@linux.dev, 
	baolin.wang@linux.alibaba.com, nico.pache@linux.dev, ziy@nvidia.com, baohua@kernel.org, 
	dev.jain@arm.com, hughd@google.com, lance.yang@linux.dev, liam@infradead.org, 
	mhocko@suse.com, ryan.roberts@arm.com, shuah@kernel.org, surenb@google.com, 
	vbabka@kernel.org, agordeev@linux.ibm.com, jgg@ziepe.ca, leon@kernel.org, 
	kernel-team@meta.com
Subject: Re: [PATCH v5 13/19] selftests/mm: cover a shared-source collapse
 write race
Message-ID: <aqB2ckEupUKnoJt_@thinkstation>
References: <20260908125105.1510704-1-kirill@shutemov.name>
 <20260908125105.1510704-14-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908125105.1510704-14-kirill@shutemov.name>

On Tue, Sep 08, 2026 at 01:50:59PM +0100, Kiryl Shutsemau wrote:
> +	close(sync[1]);
> +	if (read(sync[0], &go, 1) != 1)
> +		ksft_exit_fail_msg("child never reached the collapse\n");
> +
> +	/*
> +	 * Unshare one page at a time: a burst would break CoW on the whole
> +	 * range before the collapse starts, leaving nothing shared to collapse.
> +	 */
> +	i = 0;
> +	for (;;) {
> +		if (i < n)
> +			ip[i * stride] = i + 0xbeef0000;
> +		i++;
> +		usleep(10 * 1000);
> +		if (waitpid(child, &wstatus, WNOHANG))
> +			break;
> +	}

Sashiko flagged two issues here:

 - sync[0] never closed. It is fd leak;

 - wstatus is garbage if waitpid() fails, returning -1;

Here's a fixup:

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 335f946eca61..c0a07d75a306 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -1228,6 +1228,7 @@ static void collapse_fork_cow_race(struct collapse_context *c, struct mem_ops *o
 	close(sync[1]);
 	if (read(sync[0], &go, 1) != 1)
 		ksft_exit_fail_msg("child never reached the collapse\n");
+	close(sync[0]);
 
 	/*
 	* Unshare one page at a time: a burst would break CoW on the whole
@@ -1235,12 +1236,17 @@ static void collapse_fork_cow_race(struct collapse_context *c, struct mem_ops *o
 	*/
 	i = 0;
 	for (;;) {
+		pid_t ret;
+
 		if (i < n)
 			ip[i * stride] = i + 0xbeef0000;
 		i++;
 		usleep(10 * 1000);
-		if (waitpid(child, &wstatus, WNOHANG))
+		ret = waitpid(child, &wstatus, WNOHANG);
+		if (ret == child)
 			break;
+		if (ret < 0)
+			ksft_exit_fail_perror("waitpid()");
 	}
 
 	/* Finish whatever the paced sweep did not reach */
-- 
  Kiryl Shutsemau / Kirill A. Shutemov
