#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QOpenGLShaderProgram>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    // QOpenGLShaderProgram program;

    // program.addShaderFromSourceFile(
    //     QOpenGLShader::Vertex,
    //     ":/shaders/fullscreen.vert");

    // program.addShaderFromSourceFile(
    //     QOpenGLShader::Fragment,
    //     ":/shaders/gradient.frag");

    // program.link();                           program linking//


    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("projettback", "Main");

    return QGuiApplication::exec();
}
