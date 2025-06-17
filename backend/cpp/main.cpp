#include "crow_all.h"

int main()
{
    crow::SimpleApp app;
    CROW_ROUTE(app, "/")([]()
                         { return "Hello, Crow!"; });
    app.port(18080).run();
}
