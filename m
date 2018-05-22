From: mbenes@suse.cz (Miroslav Benes)
Date: Tue, 22 May 2018 16:27:30 +0200 (CEST)
Subject: [PATCH v4 0/1] Add livepatch kselftests
In-Reply-To: <1524680930-28168-1-git-send-email-joe.lawrence@redhat.com>
References: <1524680930-28168-1-git-send-email-joe.lawrence@redhat.com>
Message-ID: <alpine.LSU.2.21.1805221617160.1847@pobox.suse.cz>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180522142730.mg7YxJtL6rvPqIm2TeISQH4CnWkn5BQ_9BWXFluFk9Y@z>

On Wed, 25 Apr 2018, Joe Lawrence wrote:

> This round incorporates feedback from SUSE folks, Miroslav, Petr and
> Libor.  Thanks for the reviews and feedback!
> 
> Like the previous version, this applies on top of Petr's shadow variable
> changes and the atomic replace patchset.

I skimmed through it and I did not find anything suspicious. It also works 
as advertised. It'd great if someone from kselftest ML took a look.

Thanks,
Miroslav
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
