From: hch@infradead.org (Christoph Hellwig)
Date: Wed, 17 Oct 2018 09:19:06 -0700
Subject: [PATCH v2 1/2] mm: Add an F_SEAL_FS_WRITE seal to memfd
In-Reply-To: <CAKOZuesr_8vrob-XfEpGmyeKFEhWWXZo4BEC0PixfjT2ibaRZQ@mail.gmail.com>
References: <20181009222042.9781-1-joel@joelfernandes.org>
 <20181017095155.GA354@infradead.org>
 <20181017103958.GB230639@joelaf.mtv.corp.google.com>
 <20181017120829.GA19731@infradead.org>
 <CAKOZuesr_8vrob-XfEpGmyeKFEhWWXZo4BEC0PixfjT2ibaRZQ@mail.gmail.com>
Message-ID: <20181017161906.GA5096@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181017161906.OTvyxcdyBCV7gX16wfIiQ2AxpJvzOWZKskSw3Dfb9ZU@z>

On Wed, Oct 17, 2018@08:44:01AM -0700, Daniel Colascione wrote:
> > Even if no one changes these specific flags we still need a lock due
> > to rmw cycles on the field.  For example fadvise can set or clear
> > FMODE_RANDOM.  It seems to use file->f_lock for synchronization.
> 
> Compare-and-exchange will suffice, right?

Only if all users use the compare and exchange, and right now they
don't.
