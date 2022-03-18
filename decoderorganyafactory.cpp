#include "decoderorganyafactory.h"
#include "organyahelper.h"
#include "decoder_organya.h"

#include <QMessageBox>

bool DecoderOrganyaFactory::canDecode(QIODevice *) const
{
    return false;
}

DecoderProperties DecoderOrganyaFactory::properties() const
{
    DecoderProperties properties;
    properties.name = tr("Organya Plugin");
    properties.shortName = "organya";
    properties.filters << "*.org";
    properties.description = "Cave Story's org Audio File";
    properties.noInput = true;
    return properties;
}

Decoder *DecoderOrganyaFactory::create(const QString &path, QIODevice *input)
{
    Q_UNUSED(input);
    return new DecoderOrganya(path);
}

QList<TrackInfo*> DecoderOrganyaFactory::createPlayList(const QString &path, TrackInfo::Parts parts, QStringList *)
{
    TrackInfo *info = new TrackInfo(path);
    if(parts == TrackInfo::Parts())
    {
        return QList<TrackInfo*>() << info;
    }

    OrganyaHelper helper(path);
    if(!helper.initialize())
    {
        delete info;
        return QList<TrackInfo*>();
    }

    if(parts & TrackInfo::Properties)
    {
        info->setValue(Qmmp::BITRATE, helper.bitrate());
        info->setValue(Qmmp::SAMPLERATE, helper.sampleRate());
        info->setValue(Qmmp::CHANNELS, helper.channels());
        info->setValue(Qmmp::BITS_PER_SAMPLE, helper.depth());
        info->setValue(Qmmp::FORMAT_NAME, "Organya");
        info->setDuration(helper.totalTime());
    }
    return QList<TrackInfo*>() << info;
}

MetaDataModel* DecoderOrganyaFactory::createMetaDataModel(const QString &path, bool readOnly)
{
    Q_UNUSED(path);
    Q_UNUSED(readOnly);
    return nullptr;
}

void DecoderOrganyaFactory::showSettings(QWidget *parent)
{
    Q_UNUSED(parent);
}

void DecoderOrganyaFactory::showAbout(QWidget *parent)
{
    QMessageBox::about (parent, tr("About ORG Reader Plugin"),
                        tr("Qmmp ORG Reader Plugin")+"\n"+
                        tr("Written by: Greedysky <greedysky@163.com>"));
}

QString DecoderOrganyaFactory::translation() const
{
    return QString();
}
